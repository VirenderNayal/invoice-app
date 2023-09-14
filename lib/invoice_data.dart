class InvoiceData {
  InvoiceData(
    this.invoiceNumber,
    this.billToAddress,
    this.billToCity,
    this.billToName,
    this.billToPhone,
    this.fromAddress,
    this.fromCity,
    this.fromName,
    this.fromPhone,
    this.invoiceDate,
    this.items,
  );

  String invoiceNumber;
  String invoiceDate;
  String billToName;
  String billToAddress;
  String billToCity;
  String billToPhone;
  String fromName;
  String fromAddress;
  String fromCity;
  String fromPhone;
  List<Map<String, String>> items;
}
