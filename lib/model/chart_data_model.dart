class ChartDataModel {
  int? wavelength;
  double? result;

  ChartDataModel({
    this.wavelength,
    this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'wavelength': this.wavelength,
      'result': this.result,
    };
  }
}
