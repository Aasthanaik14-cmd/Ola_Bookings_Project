use Ola;

-- 1. Retrieve all successful bookings:
Create view Successful_bookings AS
select * from Bookings
where Booking_status='Success';

select * from Successful_bookings;

--  2. Find the average ride distance for each vehicle type:
create view ride_dist_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) as avg_dist
from Bookings
group by Vehicle_Type;

select* from ride_dist_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
create view rides_canceled as
select count(*) from Bookings
where Booking_Status = 'Canceled by customer';

select * from rides_canceled;

-- 4. List the top 5 customers who booked the highest number of rides:
create view high_no_of_rides as 
select Customer_ID,Count(Booking_ID)as total_rides
from Bookings
group by Customer_ID
order by total_rides desc limit 5;

select * from high_no_of_rides;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_by_drivers as
Select count(*) from Bookings 
where Canceled_Rides_by_Driver='Personal & Car related issue' ;

select*from canceled_by_drivers;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view ratings_for_prime_sedan_bookings as
select max(Driver_Ratings),min(Driver_Ratings) from Bookings
where Vehicle_Type='Prime Sedan';

select * from ratings_for_prime_sedan_bookings;


-- 7. Retrieve all rides where payment was made using UPI:
create view payments_UPI as
select *from Bookings
where Payment_Method='UPI';

select*from payments_UPI;

-- 8. Find the average customer rating per vehicle type:
create view Avg_ratings as
select Vehicle_Type,round(avg(Customer_Rating),2) as Avg_ratings
from Bookings
group by Vehicle_Type;

select * from Avg_ratings;


-- 9. Calculate the total booking value of rides completed successfully:

select sum(Booking_Value) as total_successful_rides
from Bookings
where Booking_Status='Success';

-- 10. List all incomplete rides along with the reason:

select Booking_ID, Incomplete_Rides_Reason 
from Bookings
where Incomplete_Rides='Yes';
