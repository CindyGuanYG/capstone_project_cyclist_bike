# capstone project cyclistic bike
This is a case study from Google Data Analytic Certification program for a fictional bike-share company (Cyclistic) in order to help them attract more riders.  
The data used in the analysis is from the [tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement). The data is from February 2021 to January 2022.

### Case Study: How Does a Bike-Share Navigate Speedy Success?
#### Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments.One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes,and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno, director of marketing and your manager, believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

#### Business Task
Identify how casual riders and members use Cyclistic bikes differently to design marketing strategies aimed at converting casual riders into annual members.

#### Steps that have taken to ensure that the data is clean:
* Remove duplicated data
* Remove missing data
* In the analysis of average duration, remove the outliers in ride length. Outliers< Q1- 1.5*IQR & Q3 + 1.5*IQR < Outliers.

#### Data Visualization
![average_duration_by_day_of_week](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Average_Ride_Length.jpg)
![number_of_ride_by_day_of_week](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Number_of_Rides.jpg)
![number_of_ride_by_month](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Number%20of%20Rides%20vs.%20Months.jpg)
![preference_of_bikes'_types](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Preferences%20of%20Bikes'%20Types.jpg)
![casual_user_frequently_visited_start_station](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Frequent%20Visited%20Start%20Startions.jpg)
![casual_user_frequently_visited_end_station](https://github.com/CindyGuanYG/capstone_project_cyclistic_bike/blob/main/Frequent%20Visited%20End%20Startions.jpg)
### Questions
1. How do annual members and casual riders use Cyclistic bikes differently?
The casual riders use bikes more often on the **weekends**, while annual members ride more on **Tuesday to Thursday**. It can be due to casual riders are more likely to ride for leisure, and annual members use them to commute to work.

2. Why would casual riders buy Cyclistic annual memberships?
Casual riders will buy Cyclistic annual memberships because they ride Cyclistic bikes for a **long time** than members and they are the **only users of docked bikes**. 

3. How can Cyclistic use digital media to influence casual riders to become members?
Use Facebook ads, Google ads, and podcast to introduce the benefits of being annual members. The ads can focus on the areas near the **top 7 stations** that most casual users are from. 

### Three Recommendations
* Since casual riders use Cyclistic bikes more often on the **weekends**, Cyclistic can promote the idea of using Cyclistic bike for short distance travel is cost effective and environmental friendly in reducing the use of cars. Meanwhile, Cyclistic can provide **special offers on the weekends**, such as the users will get a free single pass that can use on any day of the week in a limited time if they use Cyclistic bikes four times in the weekends of two weeks.

* Since casual riders are the **only users of docked bikes**, Cyclistic can **offer discounts on the full day pass for docked bikes** sometimes to attract casual riders use docked bikes for a longer time and more often, then Cyclistic mentions to the users being annual members can save them more money when they use Cyclistic bikes frequently.

* Cyclistic’s **advertisements** should focus on the areas near the **top 7 stations** that appear in both casual riders’ frequent visited start and end stations (e.g. Streeter Dr & Grand Ave, Millennium Park, Michigan Ave & Oak St, Shedd Aquarium, Theater on the Lake, Wells St & Concord Ln, Lake Shore Dr & Monroe St).

### Further Analysis Suggestions
* Further analysis should be conducted to ensure the if Cyclistic users’ numbers of rides are always high on June to September, and the reason behind it.
* Collect data from casual riders to analyze how much money do they spend on which type of bikes each month.
