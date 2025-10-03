

```sql
dataSource.name = 'Windows Event Logs' (* contains:anycase 'hello')
| let winEventLog.id = string(winEventLog.id)
| group count = count() by timestamp, winEventLog.id, 
  winEventLog.channel, winEventLog.description
| lookup Category,Subcategory, "Message Summary" 
  from WindowsSecurityAuditEvents.csv by Event_ID = winEventLog.id
| sort - timestamp
```

```sql
dataSource.name = 'Windows Event Logs' winEventLog.id in (1040, 1042, 11707, 1033, 4104)
| let winEventLog.id = string(winEventLog.id)
| group count = count() by timestamp = timebucket('10m'), winEventLog.id, 
  winEventLog.channel, winEventLog.description
| lookup Category,Subcategory, "Message Summary" 
  from WindowsSecurityAuditEvents.csv by Event_ID = winEventLog.id
| sort - timestamp
```

```sql
dataSource.name = 'Windows Event Logs' winEventLog.id in (1040, 1042, 11707, 1033, 4104)
| let winEventLog.id = string(winEventLog.id)
| group actions = array_agg(winEventLog.description), eventLogs = array_agg(winEventLog.id), count = count() by timestamp = timebucket('10m')
| sort - timestamp
```