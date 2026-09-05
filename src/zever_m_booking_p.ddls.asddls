@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZEVER_M_BOOKING_P
  as projection on ZEVER_M_BOOKING_I
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _CUSTOMER.LastName as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _CARRIER.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,

      _TRAVEL : redirected to parent ZEVER_M_TRAVEL_P,
      _CUSTOMER,
      _CARRIER,
      _CONNECTION
}
