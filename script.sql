SELECT *
FROM kickstarter_projects
LIMIT 10;

-- How many projects have been successful?
SELECT COUNT(Name) AS Num_of_Projects
FROM kickstarter_projects
WHERE State = 'Successful';


-- What category has the highest success percentage?
SELECT Category,
  ROUND(100.0 * SUM(CASE WHEN State='Successful' THEN 1 ELSE 0 END)/COUNT(State), 2) AS Success_Rates
FROM kickstarter_projects
GROUP BY category
ORDER BY Success_Rates DESC;

-- What project with goal over $1000 had the biggest Goal Completion pledged?(Pledged/Goal) How much money was pledged?
SELECT 
    Name,
    ROUND(100.0 * (Pledged / Goal), 2) AS Goal_completion,
    Pledged
FROM
    kickstarter_projects
WHERE
    Goal > '1000'
GROUP BY Name
ORDER BY Goal_completion DESC
LIMIT 1;


-- Which project had the highest number of backers And Pledges?
SELECT Category, 
  COUNT(Backers) AS Backers,
  SUM(Pledged) AS Pledges
FROM kickstarter_projects
GROUP BY Category
ORDER BY Backers DESC;

  

