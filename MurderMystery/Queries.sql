-- 1. Identify any access to the CEO's Office near the crime time
SELECT
  kl.log_id,
  kl.employee_id,
  e.name,
  kl.room,
  kl.entry_time,
  kl.exit_time
FROM keycard_logs kl
JOIN employees e ON kl.employee_id = e.employee_id
WHERE kl.room LIKE '%CEO%'              -- matches "CEO Office", "CEO's Office", etc.
  AND kl.entry_time BETWEEN
      TIMESTAMP '2025-10-15 20:30:00' AND  '2025-10-15 21:15:00'
ORDER BY kl.entry_time;

-- 2. Who entered the CEO's Office around the time of the murder
WITH office_entries AS (
  SELECT kl.employee_id, kl.entry_time, kl.exit_time
  FROM keycard_logs kl
  WHERE kl.room LIKE '%CEO%'
    AND kl.entry_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
)
SELECT DISTINCT
  oe.employee_id,
  emp.name,
  oe.entry_time,
  oe.exit_time
FROM office_entries oe
JOIN employees emp ON emp.employee_id = oe.employee_id
ORDER BY oe.entry_time;



-- 3. Alibi contradictions: claimed somewhere else while keycard shows presence in CEO Office window
WITH office_entries AS (
  SELECT kl.employee_id, kl.entry_time, kl.exit_time
  FROM keycard_logs kl
  WHERE kl.room LIKE '%CEO%'
    AND kl.entry_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
)
SELECT DISTINCT a.alibi_id, a.employee_id, emp.name,
       a.claimed_location, a.claim_time, oe.entry_time, oe.exit_time
FROM alibis a
JOIN employees emp ON a.employee_id = emp.employee_id
LEFT JOIN office_entries oe ON oe.employee_id = a.employee_id
WHERE a.claim_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
  AND (
       -- claimed location not CEO Office OR explicitly claimed a location incompatible with being in CEO Office
       a.claimed_location NOT LIKE '%CEO%'
       )
  AND oe.employee_id IS NOT NULL                -- they actually were in CEO office despite claiming elsewhere
ORDER BY emp.name;



-- 4. Suspicious call activity around 20:50 - 21:00
SELECT
  c.call_id,
  c.call_time,
  c.duration_sec,
  c.caller_id,
  caller_emp.name AS caller_name,
  c.receiver_id,
  receiver_emp.name AS receiver_name
FROM calls c
LEFT JOIN employees caller_emp 
       ON caller_emp.employee_id = c.caller_id
LEFT JOIN employees receiver_emp 
       ON receiver_emp.employee_id = c.receiver_id
WHERE c.call_time BETWEEN TIMESTAMP '2025-10-15 20:45:00'
                      AND  '2025-10-15 21:05:00'
ORDER BY c.call_time;



-- 5. Evidence at the CEO's Office
SELECT
  ev.evidence_id,
  ev.room,
  ev.description,
  ev.found_time
FROM evidence ev
WHERE ev.room LIKE '%CEO%'
  AND ev.found_time BETWEEN TIMESTAMP '2025-10-15 20:30:00'
                        AND  '2025-10-16 02:00:00'
ORDER BY ev.found_time;



-- Final: "Case Solved" query — returns a single column `killer`
WITH
-- (A) Entered CEO Office in the critical timeframe
in_office AS (
  SELECT DISTINCT employee_id
  FROM keycard_logs
  WHERE room LIKE '%CEO%'
    AND entry_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
),

-- (B) Alibi mismatch: claimed elsewhere during same window but keycard shows presence (adjust logic as needed)
alibi_mismatch AS (
  SELECT DISTINCT a.employee_id
  FROM alibis a
  JOIN keycard_logs kl ON kl.employee_id = a.employee_id
  WHERE a.claim_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
    AND a.claimed_location NOT LIKE '%CEO%'
    AND kl.room LIKE '%CEO%'
    AND kl.entry_time BETWEEN TIMESTAMP '2025-10-15 20:30:00' AND TIMESTAMP '2025-10-15 21:15:00'
),

-- (C) Suspicious calls participants in the time window
suspicious_calls AS (
  SELECT DISTINCT c.caller_id AS employee_id
  FROM calls c
  WHERE c.call_time BETWEEN TIMESTAMP '2025-10-15 20:45:00' AND TIMESTAMP '2025-10-15 21:05:00'
  UNION
  SELECT DISTINCT c.receiver_id AS employee_id
  FROM calls c
  WHERE c.call_time BETWEEN TIMESTAMP '2025-10-15 20:45:00' AND TIMESTAMP '2025-10-15 21:05:00'
)



SELECT e.name AS killer
FROM employees e
WHERE e.employee_id IN (SELECT employee_id FROM in_office)
  AND e.employee_id IN (SELECT employee_id FROM alibi_mismatch)
  AND e.employee_id IN (SELECT employee_id FROM suspicious_calls)
  AND e.employee_id IN (SELECT employee_id FROM evidence)
LIMIT 1; -- if multiple rows, remove LIMIT to see all candidates
