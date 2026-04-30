/// Every discrete capability the app exposes.
/// UI and navigation decisions must use these instead of raw role checks,
/// so adding a new role never requires touching individual screens.
enum AppPermission {
  // Children management
  viewChildren,
  manageChildren,
  viewAiSuggestions,

  // Schedule
  viewSchedule,
  manageSchedule,

  // Messaging (therapist ↔ parent communication)
  sendMessages,

  // Reports & progress
  viewReports,

  // Reception desk operations
  manageAppointments,
  manageRegistrations,
}
