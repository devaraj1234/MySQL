-- 1. What query would you run to get the total revenue for March of 2012?

SELECT MONTHNAME(charged_datetime) as month , SUM(amount) as total_revenue
FROM billing
WHERE charged_datetime >= '2012-03-01' AND  charged_datetime <= '2012-03-31';

-- 2. What query would you run to get total revenue collected from the client with an id of 2?

SELECT client_id, SUM(amount) 
FROM billing
WHERE client_id = '2';

-- 3. What query would you run to get all the sites that client=10 owns?

SELECT client_id, domain_name
FROM sites
WHERE client_id = '10';

-- 4. What query would you run to get total # of sites created per month per year for 
-- the client with an id of 1? What about for client=20?

SELECT client_id,SUM(site_id), YEAR(created_datetime) AS year_created, MONTH(created_datetime) as month_created
FROM sites
WHERE client_id = '1' 
GROUP BY site_id, YEAR(created_datetime), MONTH(created_datetime);

-- For 20
SELECT client_id,SUM(site_id), YEAR(created_datetime) AS year_created, MONTH(created_datetime) as month_created
FROM sites
WHERE client_id = '20'
GROUP BY site_id, YEAR(created_datetime), MONTH(created_datetime);

-- 5. What query would you run to get the total # of leads generated for each of the sites between January 1, 
-- 2011 to February 15, 2011?

SELECT CONCAT(first_name, " ", last_name) AS name, COUNT(leads.leads_id) AS leads_count, leads.registered_datetime
FROM leads
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY name;

-- 6. What query would you run to get a list of client names and the total # of leads we've 
-- generated for each of our clients between January 1, 2011 to December 31, 2011?

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads.leads_id) AS number_of_leads
FROM clients 
JOIN sites ON sites.client_id = clients.client_id 
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime between '20112-01-01' AND '2011-12-31'
GROUP BY clients.client_id;

-- 7. What query would you run to get a list of client names and the total # of 
-- leads we've generated for each client each month between months 1 - 6 of Year 2011?

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads.leads_id) AS number_of_leads, MONTHNAME(leads.registered_datetime) AS month_generated
FROM clients 
JOIN sites ON sites.client_id = clients.client_id 
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime between '2011-01-01 00:00:00' AND '2011-06-31 00:00:00'
GROUP BY clients.client_id, month_generated
ORDER BY leads.registered_datetime ASC;

-- 8. What query would you run to get a list of client names and the total # of leads we've generated for 
-- each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  
-- Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.
-- A
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.leads_id) as total_leads
FROM clients 
JOIN sites ON sites.client_id = clients.client_id 
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime between '2011-01-01' AND '2011-12-31'
GROUP BY sites.site_id
ORDER BY clients.client_id;

-- B
SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, sites.domain_name, COUNT(leads.leads_id) AS total_leads
FROM clients 
JOIN sites ON sites.client_id = clients.client_id 
JOIN leads ON sites.site_id = leads.site_id
GROUP BY sites.site_id
ORDER BY clients.client_id;

-- 9. Write a single query that retrieves total revenue collected from each client 
-- for each month of the year. Order it by client id.

SELECT clients.client_id, CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, SUM(billing.amount) AS total_revenue, MONTHNAME(billing.charged_datetime) AS month, year(billing.charged_datetime) AS year
FROM clients 
JOIN billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id, MONTHNAME(billing.charged_datetime)
ORDER BY clients.client_id, billing.charged_datetime;

-- 10. Write a single query that retrieves all the sites that each client owns. Group the results so 
-- that each row shows a new client. It will become clearer when you add a new field called 'sites' 
-- that has all the sites that the client owns. (HINT: use GROUP_CONCAT)

SELECT CONCAT(clients.first_name, ' ', clients.last_name) AS client_name, GROUP_CONCAT(sites.domain_name)
FROM clients 
JOIN sites ON clients.client_id = sites.site_id
GROUP BY clients.client_id
ORDER BY clients.client_id;

select * from billing;
select * from clients;
select * from leads;
select * from sites;


