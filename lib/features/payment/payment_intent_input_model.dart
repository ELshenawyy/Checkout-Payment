class PaymentIntentInputModel 
{
  final String ammount;
  final String currency;

  PaymentIntentInputModel(this.ammount, this.currency);

  toJson()
  {
    return
    
    {
      'amount' : ammount,
      'currency':currency,
    };
  }

}