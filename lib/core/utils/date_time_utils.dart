String formatDateTime(DateTime? dateTime) {
  if (dateTime == null) return 'No updates yet';
  return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}, ${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
