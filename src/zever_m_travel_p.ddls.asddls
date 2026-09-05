@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'TravelId' ]
define root view entity ZEVER_M_TRAVEL_P
  provider contract transactional_query
  as projection on ZEVER_M_TRAVEL_I
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _AGENCY.Name as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _CUSTOMER.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'StatusName' ]
      Status,
      _STATUS._Text.Text as StatusName : localized,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      _BOOKING : redirected to composition child ZEVER_M_BOOKING_P,
      _AGENCY,
      _CUSTOMER,
      _STATUS
}
