class MainService {
  MainService(this.name);

  final String name;

  static MainService airConditioning = MainService('Air Conditioning');
  static MainService electricalSystems = MainService('Electrical Systems');
  static MainService plumbingSystems = MainService('Plumbing Systems');
  static MainService fireFightingSystems = MainService('Fire fighting systems');
  static MainService emergencyServices = MainService('Emergency Services');
  static MainService controlAndAutomation = MainService('Control and Automation');
  static MainService other = MainService('Other');

  static List<MainService> values = [
    airConditioning,
    electricalSystems,
    plumbingSystems,
    fireFightingSystems,
    emergencyServices,
    controlAndAutomation,
    other,
  ];

  @override
  String toString() => name;
}
