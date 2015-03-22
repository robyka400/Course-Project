#The variables
Subject - The subject who performed the activity. Its range is from 1 to 30
<li> Activity - Training/Test labels,</li> 
         <ul> <li> 1 WALKING </li>
         <li>  2 WALKING_UPSTAIRS </li>
         <li> 3 WALKING_DOWNSTAIRS </li>
          <li> 4 SITTING </li>
          <li> 5 STANDING </li>
          <li> 6 LAYING </li> </ul>
<li>"total_acc_x" "total_acc_y" "total_acc_z" - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis</li>.
<li>"body_acc_x" "body_acc_y" "body_acc_z" - The body acceleration signal obtained by subtracting the gravity from the total acceleration.</li>
<li>"body_gyro_x" "body_gyro_y" "body_gyro_z" - The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.</li>

#The data
The tidy data set represents the average of each variable for each activity and each subject.

#Transformations
<ol>
  <li>Processing every observation of the variables by the mean of the 128 element vector</li>
  <li>Merging the train and test datasets by Subject, Activity</li>
  <li>Deleting duplicated elements</li>
</ol>
