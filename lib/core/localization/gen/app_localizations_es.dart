// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'iReminder';

  @override
  String get navToday => 'Hoy';

  @override
  String get navCalendar => 'Calendario';

  @override
  String get navLoans => 'Cuotas';

  @override
  String get navCategories => 'Categorías';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get onboardingTitle1 => 'Nunca olvides lo importante';

  @override
  String get onboardingBody1 =>
      'Controla el mantenimiento de electrodomésticos, revisiones del vehículo, aniversarios y mucho más, todo en un solo lugar.';

  @override
  String get onboardingTitle2 => 'Recurrencia muy sencilla';

  @override
  String get onboardingBody2 =>
      'Diaria, semanal, mensual, anual, o incluso según el calendario lunar: configúralo una vez y iReminder se encarga del resto.';

  @override
  String get onboardingTitle3 => '100% privado, 100% sin conexión';

  @override
  String get onboardingBody3 =>
      'Sin cuentas, sin nube, sin inicio de sesión. Todo permanece en tu teléfono.';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get notificationPermissionTitle => 'No te pierdas nada';

  @override
  String get notificationPermissionBody =>
      'iReminder necesita permiso para enviarte notificaciones cuando algo esté por vencer.';

  @override
  String get notificationPermissionAllow => 'Permitir notificaciones';

  @override
  String get notificationPermissionLater => 'Ahora no';

  @override
  String get homeSectionOverdue => 'Atrasado';

  @override
  String get homeSectionToday => 'Hoy';

  @override
  String get homeSectionThisWeek => 'Esta semana';

  @override
  String get homeSectionUpcoming => 'Próximamente';

  @override
  String get homeEmptyTitle => 'Todavía no hay nada aquí';

  @override
  String get homeEmptyBody =>
      'Toca + para agregar tu primer recordatorio o plan de cuotas.';

  @override
  String get fabAddReminder => 'Recordatorio';

  @override
  String get fabAddLoan => 'Plan de cuotas';

  @override
  String get actionDone => 'Hecho';

  @override
  String get actionSnooze => 'Posponer';

  @override
  String get actionEdit => 'Editar';

  @override
  String get actionDelete => 'Eliminar';

  @override
  String get actionSave => 'Guardar';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionConfirm => 'Confirmar';

  @override
  String get actionYes => 'Sí';

  @override
  String get actionNo => 'No';

  @override
  String get actionOk => 'Aceptar';

  @override
  String get actionAdd => 'Agregar';

  @override
  String get actionClose => 'Cerrar';

  @override
  String get reminderFormTitleNew => 'Nuevo recordatorio';

  @override
  String get reminderFormTitleEdit => 'Editar recordatorio';

  @override
  String get reminderFieldTitle => 'Título';

  @override
  String get reminderFieldTitleRequired => 'El título es obligatorio';

  @override
  String get reminderFieldDescription => 'Descripción (opcional)';

  @override
  String get reminderFieldCategory => 'Categoría';

  @override
  String get reminderFieldRecurrence => 'Repetición';

  @override
  String get reminderFieldStartDate => 'Fecha de inicio';

  @override
  String get reminderFieldTime => 'Hora del recordatorio';

  @override
  String get reminderFieldAdvanceNotice => 'Avisar N días antes';

  @override
  String get reminderFieldRecurrenceDay => 'Día del mes';

  @override
  String get reminderFieldRecurrenceMonth => 'Mes';

  @override
  String get reminderFieldRecurrenceWeekday => 'Día de la semana';

  @override
  String get reminderFieldIntervalDays => 'Cada N días';

  @override
  String get reminderFieldLunarDay => 'Día lunar';

  @override
  String get reminderFieldLunarMonth => 'Mes lunar';

  @override
  String get reminderDeleteConfirmTitle => '¿Eliminar este recordatorio?';

  @override
  String get reminderDeleteConfirmBody => 'Esta acción no se puede deshacer.';

  @override
  String get recurrenceNone => 'Una vez';

  @override
  String get recurrenceDaily => 'Diario';

  @override
  String get recurrenceWeekly => 'Semanal';

  @override
  String get recurrenceMonthly => 'Mensual';

  @override
  String get recurrenceYearly => 'Anual';

  @override
  String get recurrenceCustomIntervalDays => 'Cada N días';

  @override
  String get recurrenceLunarYearly => 'Anual (calendario lunar)';

  @override
  String get weekdayMonday => 'Lunes';

  @override
  String get weekdayTuesday => 'Martes';

  @override
  String get weekdayWednesday => 'Miércoles';

  @override
  String get weekdayThursday => 'Jueves';

  @override
  String get weekdayFriday => 'Viernes';

  @override
  String get weekdaySaturday => 'Sábado';

  @override
  String get weekdaySunday => 'Domingo';

  @override
  String get loanListTitle => 'Cuotas y préstamos';

  @override
  String get loanFormTitleNew => 'Nuevo plan de cuotas';

  @override
  String get loanFormTitleEdit => 'Editar plan de cuotas';

  @override
  String get loanFieldName => 'Nombre';

  @override
  String get loanFieldCategory => 'Categoría';

  @override
  String get loanFieldTotalAmount => 'Monto total (opcional)';

  @override
  String get loanFieldInstallmentAmount => 'Monto por cuota';

  @override
  String get loanFieldTotalInstallments => 'Número de cuotas';

  @override
  String get loanFieldFrequency => 'Frecuencia';

  @override
  String get loanFieldDueDayOfMonth => 'Día de vencimiento del mes';

  @override
  String get loanFieldStartDate => 'Fecha de inicio';

  @override
  String get loanFieldReminderAdvanceDays =>
      'Avisar N días antes del vencimiento';

  @override
  String get loanFieldNotes => 'Notas (opcional)';

  @override
  String get loanFrequencyMonthly => 'Mensual';

  @override
  String get loanFrequencyWeekly => 'Semanal';

  @override
  String get loanFrequencyBiweekly => 'Quincenal';

  @override
  String loanProgress(int paid, int total) {
    return '$paid / $total cuotas pagadas';
  }

  @override
  String get loanMarkPaid => 'Marcar como pagada';

  @override
  String loanMarkPaidBatch(int count) {
    return 'Marcar $count cuotas como pagadas';
  }

  @override
  String get loanStatusPending => 'Pendiente';

  @override
  String get loanStatusPaid => 'Pagada';

  @override
  String get loanStatusOverdue => 'Atrasada';

  @override
  String loanInstallmentNumber(int number) {
    return 'Cuota n.º $number';
  }

  @override
  String get loanDeleteConfirmTitle => '¿Eliminar este plan de cuotas?';

  @override
  String loanDeleteConfirmBody(int count) {
    return 'Las $count cuotas también se eliminarán.';
  }

  @override
  String get categoryManagerTitle => 'Categorías';

  @override
  String get categoryFormTitleNew => 'Nueva categoría';

  @override
  String get categoryFormTitleEdit => 'Editar categoría';

  @override
  String get categoryFieldName => 'Nombre';

  @override
  String get categoryFieldNameRequired => 'El nombre es obligatorio';

  @override
  String get categoryFieldIcon => 'Ícono';

  @override
  String get categoryFieldColor => 'Color';

  @override
  String get categoryDefaultBadge => 'Predeterminada';

  @override
  String get categoryDeleteSimpleTitle => '¿Eliminar esta categoría?';

  @override
  String get categoryDeleteSimpleBody =>
      'Esta categoría no tiene recordatorios.';

  @override
  String get categoryDeleteHasRemindersTitle =>
      'Esta categoría todavía tiene recordatorios';

  @override
  String categoryDeleteHasRemindersBody(int count) {
    return '$count recordatorios usan esta categoría. Elige cómo proceder.';
  }

  @override
  String get categoryDeleteReassign => 'Mover a otra categoría';

  @override
  String get categoryDeleteReassignTarget => 'Mover a';

  @override
  String categoryDeleteRemoveAll(int count) {
    return 'Eliminar los $count recordatorios';
  }

  @override
  String categoryDeleteRemoveAllConfirm(int count) {
    return 'Esto eliminará permanentemente $count recordatorios. Esta acción no se puede deshacer.';
  }

  @override
  String get categoryReorderHint => 'Arrastra para reordenar';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsDefaultReminderTime =>
      'Hora de recordatorio predeterminada';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsThemeSystem => 'Sistema';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsBackupRestore => 'Copia de seguridad y restauración';

  @override
  String get settingsExport => 'Exportar copia de seguridad';

  @override
  String get settingsImport => 'Restaurar desde copia de seguridad';

  @override
  String get settingsExportSuccess => 'Copia de seguridad guardada';

  @override
  String get settingsImportSuccess => 'Copia de seguridad restaurada';

  @override
  String get settingsImportConfirmTitle => '¿Restaurar copia de seguridad?';

  @override
  String get settingsImportConfirmBody =>
      'Esto reemplazará todos los datos actuales con el contenido del archivo de copia de seguridad.';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsBatteryOptimizationTitle =>
      '¿Las notificaciones no llegan a tiempo?';

  @override
  String get settingsBatteryOptimizationBody =>
      'Algunos fabricantes (Samsung, Xiaomi, Oppo...) restringen bastante las apps en segundo plano. Desactiva la optimización de batería para iReminder en Ajustes > Batería para asegurarte de que los recordatorios siempre lleguen a tiempo.';

  @override
  String get errorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get errorLoadFailed => 'No se pudieron cargar los datos.';
}
