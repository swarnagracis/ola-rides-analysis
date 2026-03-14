CREATE DATABASE ola_rides_db;
Use ola_rides_db;
Select count(*) from rides; 
Desc rides;
Select * from rides;

#Retrieve all successful bookings
Select * from rides
where Booking_Status = 'Success';
Select COUNT(*) From rides
Where Booking_Status = 'Success';

#Peak Booking Hours
Select Hour, Count(Booking_ID) as total_bookings
from rides
group by Hour
order by total_bookings desc;

#Average Distance for each Vehicle Type
Select Vehicle_Type, 
Avg(Ride_Distance) as avg_ride_distance
from rides
where Ride_Distance>0
group by Vehicle_Type;
 
#Total number of Cancelled Rides by Customer
Select Count(*) as total_customer_cancellations from rides
where Booking_Status = 'Canceled by Customer';

#Top 5 Customer with highest bookings
Select Customer_ID, Count(*) as total_rides 
from rides
group by Customer_ID
order by total_rides desc
Limit 5;

#Customer Cancellations
Select Canceled_Rides_by_Customer, Count(*) as customer_cancellations
from rides
where Booking_Status = 'Canceled by Customer'
group by Canceled_Rides_by_Customer
order by customer_cancellations desc;

#Driver Cancellations
Select Canceled_Rides_by_Driver, Count(*) as driver_cancellations
from rides
where Booking_Status = 'Canceled by Driver'
group by Canceled_Rides_by_Driver
order by driver_cancellations desc; 

#Number of rides cancelled by drivers due to personal & car-related issues
Select Canceled_Rides_by_Driver from rides;
Select Count(*) as personal_car_issues from rides
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#Maximum and minimum driver ratings for Prime Sedan bookings
Select Max(Driver_Ratings) as max_driver_rating, 
Min(Driver_Ratings) as min_driver_rating from rides
where Vehicle_Type = 'Prime Sedan';

#Customer Vehicle Preferences
Select Vehicle_Type, Count(*) as total_rides
from rides
group by Vehicle_Type
order by total_rides desc;

#Customer Payment Method Preference
Select Payment_Method, Count(*) as total_usage
from rides
group by Payment_Method
order by total_usage desc;

#All Rides used UPI Payment
Select * from rides
where Payment_Method = 'UPI';

#Revenue by Month
Select Month, Sum(Booking_Value) as total_revenue
from rides
where Booking_Status = 'Success'
group by Month
order by Month;

#Revenue by Day of Week
Select Day, Sum(Booking_Value) as revenue_by_day
from rides
where Booking_Status = 'Success'
group by Day
order by Day desc;

#Average customer rating per vehicle type
Select Vehicle_Type, Avg(Customer_Rating) as avg_customer_rating
from rides
where Customer_Rating > 0
group by Vehicle_Type;

#Average Driver Ratings
Select Vehicle_Type, Avg(Driver_Ratings) as avg_driver_ratings
from rides
where Driver_Ratings > 0
group by Vehicle_Type
order by avg_driver_ratings desc;

#Total booking value of successfully completed rides
Select Sum(Booking_Value) as total_success_bookings
from rides
where Booking_Status = 'Success';

#List of incomplete rides
Select Count(*) from rides where Incomplete_Rides = 'Yes';
Select Booking_ID, Customer_ID, Incomplete_Rides, Incomplete_Rides_Reason
from rides
where Incomplete_Rides = 'Yes';

CREATE VIEW peak_booking_hours AS
SELECT Hour, COUNT(*) AS total_rides
FROM rides
GROUP BY Hour;