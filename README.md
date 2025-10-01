

```sql
dataSource.name = 'Windows Event Logs' (* contains:anycase 'hello')
| let winEventLog.id = string(winEventLog.id)
| group count = count() by timestamp, winEventLog.id, 
  winEventLog.channel, winEventLog.description
| lookup Category,Subcategory, "Message Summary" 
  from WindowsSecurityAuditEvents.csv by Event_ID = winEventLog.id
| sort - timestamp
```