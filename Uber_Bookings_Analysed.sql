CREATE Database Uber;
USE Uber;

#1 Retrive all Successfull Bookings
Create View Successfull_Bookings AS
Select * FROM bookings 
WHERE `Booking Status`='Success';

#2 Find the average ride distance for each vehicle type
Create View Avg_Ride_Distance_for_each_Vehicle AS
Select `Vehicle Type`, avg(`Ride Distance`) 
FROM bookings GROUP BY `Vehicle Type`ORDER BY avg(`Ride Distance`) ASC ;

#3 Get the total number of cancelled rides by customers
Create View cancelled_rides AS
Select count(*) from bookings 
WHERE `Cancelled Rides By Customer`= 1 ;

#4  List the top 5 customers who booked the highest number of rides
Create View Top_5_Customers AS
SELECT `Customer ID`, COUNT(*) AS ride_count 
FROM bookings 
GROUP BY `Customer ID`
ORDER BY ride_count DESC  
LIMIT 5;

#5 Get the number of rides cancelled by drivers due to personal and car-related issues:
Select count(*) from bookings 
WHERE `Reason for cancelling by Driver` = "Personal & Car related issues";

#6 Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(`Driver Ratings`) AS Max_Rating, MIN(`Driver Ratings`) AS Min_Rating FROM bookings
WHERE `Vehicle Type` = 'Prime Sedan'
AND `Driver Ratings` IS NOT NULL;

#7. Retrieve all rides where the booking value is greater than ₹1000 and the ride distance is more than 10 km.
SELECT * from bookings WHERE `Booking Value`> 1000 AND `Ride Distance`> 10 
ORDER BY `Booking Value` ASC;

#8 Find the average customer rating per vehicle type
SELECT `Vehicle Type`, avg(`Customer Rating`) from bookings
GROUP BY `Vehicle Type` 
ORDER BY avg(`Customer Rating`) DESC;

#9 Calculate the total booking value of rides completed successfully
Select sum(`Booking Value`) from bookings 
WHERE `Booking Status` = 'Success';

#10 List all incomplete rides along with the reason:
Select `Incomplete Rides`,`Incomplete Rides Reason` from bookings 
WHERE `Incomplete Rides`= 1;








