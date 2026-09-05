@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZEVER_M_BOOKING_I
  as select from /dmo/booking
  association        to parent ZEVER_M_TRAVEL_I as _TRAVEL     on  $projection.TravelId = _TRAVEL.TravelId
  association [0..1] to /DMO/I_Customer         as _CUSTOMER   on  $projection.CustomerId = _CUSTOMER.CustomerID
  association [0..1] to /DMO/I_Carrier          as _CARRIER    on  $projection.CarrierId = _CARRIER.AirlineID
  association [0..1] to /DMO/I_Connection       as _CONNECTION on  $projection.CarrierId    = _CONNECTION.AirlineID
                                                               and $projection.ConnectionId = _CONNECTION.ConnectionID
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,

      _TRAVEL,
      _CUSTOMER,
      _CARRIER,
      _CONNECTION
}
