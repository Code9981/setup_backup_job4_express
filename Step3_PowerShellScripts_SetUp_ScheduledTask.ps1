<#
This is to create Scheduled task --Please note that Scheduled task module is not available before v3
Using the batch file location you have in step2 and modify the $trigger for your desired scheduled time,  TaskName for the task name, description for the task desc.
#>

$action= new-scheduledTaskAction  -execute 'c:\users\SQLBACKUP.bat'
$trigger=new-scheduledTaskTrigger -daily -at 9pm
register-scheduledTask -Action $action -Trigger $trigger -Taskname "Backup MyDB " -Description "SQL backup datanase MyDB daily at 9pm"
  
<#### 
----To delete the task run the following

Unregister-scheduledTask -TaskName "taskname"  

##>