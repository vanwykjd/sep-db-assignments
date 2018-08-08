#### 1. In your own words, explain the benefits of normalization. Include a real-world scenario where normalization is necessary.

   When data is normalized properly within a database, it allows data to be created and updated more efficiently due to the narrow nature of the tables. When entities can be broken up into multiple subset tables that only contain unique data keys and their dependencies, this results in fewer columns and, usually, fewer indexes per table. This allows index searching and data modification to be faster, and the integrity of the data to be upheld when updates are made.

   An example would be if a car manufacturer had a database with a table consisting of all the cars that is has manufactured. Within that database, there would be a table to document each: cars manufactured, car models, assembly plants, car parts catalog, and part manufacturing plants. The cars manufactured table would contain a data key that has been assigned a production id for each car that has been manufactured. The model of the car manufactured would be a dependencies of the production id, the assembly plant and the car parts catalog would be dependencies of the model manufactured, and the part manufacturing plants would be dependencies of each car part within the car parts catalog for each car model that was manufactured.  

#### 2. List and explain the different normal forms and how they relate to one another, with regard to your real-world scenario in the first question.

   **First normal form (1NF) :**  
   First normal form is the base and starting form requirement for every degree of normal forms. For a table to meet 1NF standards, each field within a record must only contain one value.
      
   *Non*-1NF table:  
      
   | production_id        | model | part_id                          |  
   | -------------------- |:-----:| :------------------------------: |  
   | 1201                 | X5    | 15-25-001, 25-85-051, 35-85-5000 |  
   | 1257                 | X3    | 13-23-001, 23-83-031, 33-83-3000 |  
   | 1268                 | X5    | 15-25-001, 25-85-051, 35-85-5000 |
      
   1NF table:  
   
   | production_id        | model | part_id   |  
   | -------------------- |:-----:| :---------|  
   | 1201                 | X5    | 15-25-001 |  
   | 1201                 | X5    | 25-85-051 |
   | 1201                 | X5    | 35-85-500 |
   | 1257                 | X3    | 13-23-001 | 
   | 1257                 | X3    | 23-83-031 | 
   | 1257                 | X3    | 33-83-300 | 
   | 1268                 | X5    | 15-25-001 |
   | 1268                 | X5    | 25-85-051 |
   | 1268                 | X5    | 35-85-500 |
   <br/>
      
   **Second normal form (2NF) :**  
   In order for a table to meet 2NF standards, it must first be 1NF compliant. In addition to being 1NF compliant, the table must not contain any attributes of subsets that are dependencies of the current tables primary key.  
         
   *Non*-2NF table:  
   
   | model | assembly_plant | parts_catalog_id |
   |:-----:| :-------------:| :--------------: |
   | X5    | Spartenburg    | 245              |
   | X3    | Spartenburg    | 243              |   

   The table above meets the 1NF requirements, however, it is not 2NF compliant since the parts_catalog_id is only dependent upon the model and not both, model and assembly_plant. In order to make this data satisfy 2NF, we would need to split the data into two separate tables:   
      
   2NF table: (table 1)   
   
   | model | assembly_plant |
   |:-----:| :------------: |
   | X5    | Spartenburg    |
   | X3    | Spartenburg    |   
     
   2NF table: (table 2)  
   
   | model | parts_catalog_id |
   |:-----:| :--------------: |
   | X5    | 245              |
   | X3    | 243              |
   <br/>
      
   **Third normal form (3NF) :**  
   In order for a table to meet 3NF standards, it must first be 1NF compliant, as well as 2NF compliant. In addition to being 1NF and 2NF compliant, all the attributes within the table are directly dependent upon the candidate keys and not by any non-prime attributes.  
   
   *Non*-3NF table:  
      
   | model | parts_catalog_id | part_id   | part_manufacturing_plant |
   |:-----:| :--------------: | :-------: | :----------------------: |
   | X5    | 245              | 15-25-001 |	Landshut, DE             |
   | X5    | 245              | 25-85-051 | Berlin, DE               |
   | X5    | 245              | 35-85-500 |	Leipzig, DE              |
   | X3    | 243              | 13-23-001 | Munich, DE               |
   | X3    | 243              | 23-83-031 | Dingolfing, DE           |
   | X3    | 243              | 33-83-300 | Eisenach, DE             |
   <br/>   

   The table above meets the 1NF requirements and 2NF, however, it is not 3NF compliant since the part_id and part_manufacturing_plant fields are transitively dependent upon the parts_catalog_id, which is dependent upon the model. In order to make this data satisfy 3NF, we would need to split the data into two separate tables:   
      
   3NF table: (table 1)   
      
   | model | parts_catalog_id |
   |:-----:| :--------------: |
   | X5    | 245              |
   | X5    | 245              |
   | X5    | 245              |
   | X3    | 243              |
   | X3    | 243              |
   | X3    | 243              |
     
   3NF table: (table 2)  
      
   | parts_catalog_id | part_id   | part_manufacturing_plant |
   | :--------------: | :-------: | :----------------------: |
   | 245              | 15-25-001 |	 Landshut, DE            |
   | 245              | 25-85-051 |  Berlin, DE              |
   | 245              | 35-85-500 |	 Leipzig, DE             |
   | 243              | 13-23-001 |  Munich, DE              |
   | 243              | 23-83-031 |  Dingolfing, DE          |
   | 243              | 33-83-300 |  Eisenach, DE            |
   <br/>
      
   **Boyce Codd normal form (BCNF) :**  
   BCNF is a slightly stricter version of 3NF. This means that in order for a table to meet BCNF, it must first be 3NF compliant. In adition to meeting 3NF conditions, any dependency must be have a relation to a unique key that is capable of identifying all other attributes (super key). This means that for a dependency (A) → (B), (A) cannot be a non-prime attribute, if (B) is a prime attribute. Therefore, any dependency (A) → (B), (A) should be a super key.   
   <br/>
   In order for the car manufacturing data to meet BCNF, we would need to structure the tables as followed:
         
   | production_id | parts_catalog_id |
   | :-----------: | :--------------: |
   | 1201          | 245              |
   | 1257          | 243              |
      
   | parts_catalog_id | part_id   | part_manufacturing_plant |
   | :--------------: | :-------: | :----------------------: |
   | 245              | 15-25-001 |	Landshut, DE             |
   | 243              | 13-23-001 | Munich, DE               |
      
   | model | assembly_plant |
   | :---: | :------------: |
   | X5    | Spartenburg    |
   | X3    | Spartenburg    |
   
   | production_id | model |
   | :-----------: | :---: |
   | 1201          | X5    |
   | 1257          | X3    |
   <br/>
      
#### 3. This student_records table contains students and their grades in different subjects. The schema is already in first normal form (1NF). Convert this schema to the third normal form (3NF) using the techniques you learned in this checkpoint.  

   *Convert to 3NF:*
	  
   | student_id  | student_name | student_email            |
   | :---------: | :----------  | :----------------------  |
   | 1           | John B       | john.b20@hogwarts.edu    |
   | 2           | Sarah S      | sarah.s20@hogwarts.edu   |
   | 3           | Martha L     | martha.l20@hogwarts.edu  |
   | 4           | James G      | james.g20@hogwarts.edu   |
   | 5           | Stanley P    | stanley.p20@hogwarts.edu |
      
   | professor_id | professor_name | 
   | :----------: | :------------  |
   | 1            | Natalie M      | 
   | 2            | William C      | 
   | 3            | Mark W         |
          
   | class_id | subject       | professor_id |
   | :------: | :-----------  | :----------: |
   | 1        | Economics     | 1            |
   | 2        | Philosophy    | 2            |
   | 3        | Mathematics   | 3            |
      
   | grade_id | sudent_id | class_id  | grade |
   | :------: | :-------: | :-------: |:-----:|
   | 1        | 1         | 2         | A     |
   | 2        | 2         | 2         | C     |
   | 3        | 3         | 1         | A     |
   | 4        | 4         | 3         | B     |
   | 5        | 5         | 1         | B     |
      
#### 4. In your own words, explain the potential disadvantages of normalizing the data above. What are its trade-offs? Submit your findings in the submission table and discuss them with your mentor in your next session. 

As the variety of data types to be stored within a normalized database increases, the number of tables needing to be created increases as well. Because of this, more table joins are required, making queries complex. When normalized database contains a large amount of joins, indexing doesn't work as efficiently, causing the read times to become slower. This makes read-intensive applications to have slower performance times. However, if an application is more write-intensive, a normalized database offers a faster performance when creating tables.


#### 5. Looking at the tables you have normalized. If you need to denormalize to improve query performance or speed up reporting, how would you carry out denormalization for this database design? Submit potential strategies in the submission tab and discuss them with your mentor in your next session.

   I would leave the student table as is, but combine the rest of the fields from the other tables as followed:
      
   | subject     | professor_name | sudent_id | grade |
   | :---------: | :------------: | :-------: |:-----:|
   | Philosophy  | William C      | 1         | A     |
   | Philosophy  | William C      | 2         | C     |
   | Economics   | Natalie M      | 3         | A     |
   | Mathematics | Mark W         | 4         | B     |
   | Economics   | Natalie M      | 5         | B     |      


#### 6. Explore the trade-offs between data normalization and denormalization in this scenario, submit your findings in the submission tab, and discuss them with your mentor in your next session.

   When the data from this scenario is normalized, looking at each table makes it easy to understand what fields are directly related to the records that they contain. However, when looking at all the tables collectively, it can become confusing when trying create a link individual records from each table. 
    
   When the data from this scenario is denormalized, looking at the data within the tables can make it a little confusing trying to distinguish what fields are directly associated to one another. However, the tables seem to make it a little more clear when trying to analyze how one would try to lookup particular values. 
      