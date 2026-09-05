CLASS lsc_zever_m_travel_i DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zever_m_travel_i IMPLEMENTATION.

  METHOD save_modified.

    DATA : lt_travel_log  TYPE TABLE OF zever_travel_l,
           lt_booking_log TYPE TABLE OF zever_booking_l.

*- CREATE
    IF create-zever_m_travel_i IS NOT INITIAL.
      LOOP AT create-zever_m_travel_i INTO DATA(ls_create_travel).
        APPEND INITIAL LINE TO lt_travel_log ASSIGNING FIELD-SYMBOL(<fs_travel_log>).
        <fs_travel_log>-operation     = 'CREATE'.
        <fs_travel_log>-travel_id     = ls_create_travel-TravelId.
        <fs_travel_log>-agency_id     = ls_create_travel-AgencyId.
        <fs_travel_log>-customer_id   = ls_create_travel-CustomerId.
        <fs_travel_log>-begin_date    = ls_create_travel-BeginDate.
        <fs_travel_log>-end_date      = ls_create_travel-EndDate.
        <fs_travel_log>-booking_fee   = ls_create_travel-BookingFee.
        <fs_travel_log>-total_price   = ls_create_travel-TotalPrice.
        <fs_travel_log>-currency_code = ls_create_travel-CurrencyCode.
        <fs_travel_log>-description   = ls_create_travel-Description.
        <fs_travel_log>-status        = ls_create_travel-Status.
        <fs_travel_log>-createdby     = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_travel_log>-createdat.
        TRY.
            <fs_travel_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

    IF create-zever_m_booking_i IS NOT INITIAL.
      LOOP AT create-zever_m_booking_i INTO DATA(ls_create_booking).
        APPEND INITIAL LINE TO lt_booking_log ASSIGNING FIELD-SYMBOL(<fs_booking_log>).
        <fs_booking_log>-operation     = 'CREATE'.
        <fs_booking_log>-travel_id     = ls_create_booking-TravelId.
        <fs_booking_log>-booking_id    = ls_create_booking-BookingId.
        <fs_booking_log>-booking_date  = ls_create_booking-BookingDate.
        <fs_booking_log>-customer_id   = ls_create_booking-CustomerId.
        <fs_booking_log>-carrier_id    = ls_create_booking-CarrierId.
        <fs_booking_log>-connection_id = ls_create_booking-ConnectionId.
        <fs_booking_log>-flight_date   = ls_create_booking-FlightDate.
        <fs_booking_log>-flight_price  = ls_create_booking-FlightPrice.
        <fs_booking_log>-currency_code = ls_create_booking-CurrencyCode.
        <fs_booking_log>-createdby     = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_booking_log>-createdat.
        TRY.
            <fs_booking_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

*- UPDATE
    IF update-zever_m_travel_i IS NOT INITIAL.
      LOOP AT update-zever_m_travel_i INTO DATA(ls_update_travel).
        APPEND INITIAL LINE TO lt_travel_log ASSIGNING <fs_travel_log>.
        <fs_travel_log>-operation     = 'UPDATE'.
        <fs_travel_log>-travel_id     = ls_update_travel-TravelId.
        <fs_travel_log>-agency_id     = ls_update_travel-AgencyId.
        <fs_travel_log>-customer_id   = ls_update_travel-CustomerId.
        <fs_travel_log>-begin_date    = ls_update_travel-BeginDate.
        <fs_travel_log>-end_date      = ls_update_travel-EndDate.
        <fs_travel_log>-booking_fee   = ls_update_travel-BookingFee.
        <fs_travel_log>-total_price   = ls_update_travel-TotalPrice.
        <fs_travel_log>-currency_code = ls_update_travel-CurrencyCode.
        <fs_travel_log>-description   = ls_update_travel-Description.
        <fs_travel_log>-status        = ls_update_travel-Status.
        <fs_travel_log>-createdby = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_travel_log>-createdat.
        TRY.
            <fs_travel_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

    IF update-zever_m_booking_i IS NOT INITIAL.
      LOOP AT update-zever_m_booking_i INTO DATA(ls_update_booking).
        APPEND INITIAL LINE TO lt_booking_log ASSIGNING <fs_booking_log>.
        <fs_booking_log>-operation     = 'UPDATE'.
        <fs_booking_log>-travel_id     = ls_update_booking-TravelId.
        <fs_booking_log>-booking_id    = ls_update_booking-BookingId.
        <fs_booking_log>-booking_date  = ls_update_booking-BookingDate.
        <fs_booking_log>-customer_id   = ls_update_booking-CustomerId.
        <fs_booking_log>-carrier_id    = ls_update_booking-CarrierId.
        <fs_booking_log>-connection_id = ls_update_booking-ConnectionId.
        <fs_booking_log>-flight_date   = ls_update_booking-FlightDate.
        <fs_booking_log>-flight_price  = ls_update_booking-FlightPrice.
        <fs_booking_log>-currency_code = ls_update_booking-CurrencyCode.
        <fs_booking_log>-createdby     = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_booking_log>-createdat.
        TRY.
            <fs_booking_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

*- DELETE
    IF delete-zever_m_travel_i IS NOT INITIAL.
      LOOP AT delete-zever_m_travel_i INTO DATA(ls_delete_travel).
        APPEND INITIAL LINE TO lt_travel_log ASSIGNING <fs_travel_log>.
        <fs_travel_log>-operation = 'DELETE'.
        <fs_travel_log>-travel_id = ls_delete_travel-TravelId.
        <fs_travel_log>-createdby = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_travel_log>-createdat.
        TRY.
            <fs_travel_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

    IF delete-zever_m_booking_i IS NOT INITIAL.
      LOOP AT delete-zever_m_booking_i INTO DATA(ls_delete_booking).
        APPEND INITIAL LINE TO lt_booking_log ASSIGNING <fs_booking_log>.
        <fs_booking_log>-operation  = 'DELETE'.
        <fs_booking_log>-travel_id  = ls_delete_booking-TravelId.
        <fs_booking_log>-booking_id = ls_delete_booking-BookingId.
        <fs_booking_log>-createdby     = cl_abap_context_info=>get_user_technical_name( ).
        GET TIME STAMP FIELD <fs_booking_log>-createdat.
        TRY.
            <fs_booking_log>-log_id = cl_system_uuid=>create_uuid_x16_static( ).
          CATCH cx_uuid_error.
        ENDTRY.
      ENDLOOP.
    ENDIF.

    IF lt_travel_log IS NOT INITIAL.
      MODIFY zever_travel_l FROM TABLE @lt_travel_log.
    ENDIF.

    IF lt_booking_log IS NOT INITIAL.
      MODIFY zever_booking_l FROM TABLE @lt_booking_log.
    ENDIF.

*- UNMANAGED SAVE
    TYPES: ty_booking_create TYPE /dmo/booking,
           ty_booking_update TYPE /dmo/booking WITH INDICATORS control TYPE abap_bool,
           ty_booking_delete TYPE /dmo/booking.

    DATA : lt_booking_create TYPE TABLE OF ty_booking_create,
           lt_booking_update TYPE TABLE OF ty_booking_update,
           lt_booking_delete TYPE TABLE OF ty_booking_delete.

*- CREATE
    IF create-zever_m_booking_i IS NOT INITIAL.
      LOOP AT create-zever_m_booking_i INTO ls_create_booking.
        APPEND INITIAL LINE TO lt_booking_create ASSIGNING FIELD-SYMBOL(<fs_booking_create>).
        <fs_booking_create>-travel_id     = ls_create_booking-TravelId.
        <fs_booking_create>-booking_id    = ls_create_booking-BookingId.
        <fs_booking_create>-booking_date  = ls_create_booking-BookingDate.
        <fs_booking_create>-customer_id   = ls_create_booking-CustomerId.
        <fs_booking_create>-carrier_id    = ls_create_booking-CarrierId.
        <fs_booking_create>-connection_id = ls_create_booking-ConnectionId.
        <fs_booking_create>-flight_date   = ls_create_booking-FlightDate.
        <fs_booking_create>-flight_price  = ls_create_booking-FlightPrice.
        <fs_booking_create>-currency_code = ls_create_booking-CurrencyCode.
      ENDLOOP.
    ENDIF.

*- UPDATE
    IF update-zever_m_booking_i IS NOT INITIAL.
      LOOP AT update-zever_m_booking_i INTO ls_update_booking.
        APPEND INITIAL LINE TO lt_booking_update ASSIGNING FIELD-SYMBOL(<fs_booking_update>).
        <fs_booking_update>-travel_id     = ls_update_booking-TravelId.
        <fs_booking_update>-booking_id    = ls_update_booking-BookingId.
        <fs_booking_update>-booking_date  = ls_update_booking-BookingDate.
        <fs_booking_update>-customer_id   = ls_update_booking-CustomerId.
        <fs_booking_update>-carrier_id    = ls_update_booking-CarrierId.
        <fs_booking_update>-connection_id = ls_update_booking-ConnectionId.
        <fs_booking_update>-flight_date   = ls_update_booking-FlightDate.
        <fs_booking_update>-flight_price  = ls_update_booking-FlightPrice.
        <fs_booking_update>-currency_code = ls_update_booking-CurrencyCode.

        <fs_booking_update>-control-booking_date  = COND #( WHEN ls_update_booking-%control-BookingDate  = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-customer_id   = COND #( WHEN ls_update_booking-%control-CustomerId   = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-carrier_id    = COND #( WHEN ls_update_booking-%control-CarrierId    = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-connection_id = COND #( WHEN ls_update_booking-%control-ConnectionId = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-flight_date   = COND #( WHEN ls_update_booking-%control-FlightDate   = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-flight_price  = COND #( WHEN ls_update_booking-%control-FlightPrice  = '01' THEN 'X' ELSE space ).
        <fs_booking_update>-control-currency_code = COND #( WHEN ls_update_booking-%control-CurrencyCode = '01' THEN 'X' ELSE space ).
      ENDLOOP.
    ENDIF.

*- DELETE
    IF delete-zever_m_booking_i IS NOT INITIAL.
      LOOP AT delete-zever_m_booking_i INTO ls_delete_booking.
        APPEND INITIAL LINE TO lt_booking_delete ASSIGNING FIELD-SYMBOL(<fs_booking_delete>).
        <fs_booking_delete>-travel_id  = ls_delete_booking-TravelId.
        <fs_booking_delete>-booking_id = ls_delete_booking-BookingId.
      ENDLOOP.
    ENDIF.

    IF lt_booking_create IS NOT INITIAL.
      MODIFY /dmo/booking FROM TABLE @lt_booking_create.
    ENDIF.

    IF lt_booking_update IS NOT INITIAL.
      UPDATE /dmo/booking FROM TABLE @lt_booking_update INDICATORS SET STRUCTURE control.
    ENDIF.

    IF lt_booking_delete IS NOT INITIAL.
      DELETE /dmo/booking FROM TABLE @lt_booking_delete.
    ENDIF.

    call function '/DMO/FLIGHT_TRAVEL_READ'
      EXPORTING
        iv_travel_id          = ls_delete_booking-TravelId
*        iv_include_buffer     = abap_true
*      IMPORTING
*        es_travel             =
*        et_booking            =
*        et_booking_supplement =
*        et_messages           =
      .

*    call FUNCTION 'bapi_flight_getlist'.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_zever_m_booking_i DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validateCustomer FOR VALIDATE ON SAVE
       keys FOR zever_m_booking_i~validateCustomer.
    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
       keys FOR zever_m_booking_i~calculateTotalPrice.

ENDCLASS.

CLASS lhc_zever_m_booking_i IMPLEMENTATION.

  METHOD validateCustomer.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i BY \_booking
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    IF lt_result IS NOT INITIAL.
      SELECT a~customer_id
        FROM /dmo/customer AS a INNER JOIN @lt_result AS b ON a~customer_id = b~customerid
       ORDER BY a~customer_id
        INTO TABLE @DATA(lt_customer).
    ENDIF.

    LOOP AT lt_result INTO DATA(ls_result).

      APPEND INITIAL LINE TO reported-zever_m_booking_i ASSIGNING FIELD-SYMBOL(<fs_reported>).
      <fs_reported>-%tky = ls_result-%tky.
      <fs_reported>-%state_area = 'VALIDATE_BOOKING_CUSTOMER'.

      IF ls_result-customerid IS NOT INITIAL.
        READ TABLE lt_customer INTO DATA(ls_customer) WITH KEY customer_id = ls_result-customerid BINARY SEARCH.
        IF sy-subrc <> 0.
          APPEND INITIAL LINE TO failed-zever_m_booking_i ASSIGNING FIELD-SYMBOL(<fs_failed>).
          <fs_failed>-%tky = ls_result-%tky.
          APPEND INITIAL LINE TO reported-zever_m_booking_i ASSIGNING <fs_reported>.
          <fs_reported>-%tky = ls_result-%tky.
          <fs_reported>-%element-customerid = if_abap_behv=>mk-on.
          <fs_reported>-%path-zever_m_travel_i-%tky = CORRESPONDING #( ls_result-%tky ).
          <fs_reported>-%state_area = 'VALIDATE_BOOKING_CUSTOMER'.
          <fs_reported>-%msg = new_message( severity = if_abap_behv_message=>severity-error
                                            id       = 'ZEVER_M'
                                            number   = '000'
                                            v1       = TEXT-m01 ).
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD calculateTotalPrice.

    MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    EXECUTE recalcTotPrice
    FROM CORRESPONDING #( keys ).

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZEVER_M_TRAVEL_I DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zever_m_travel_i RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zever_m_travel_i RESULT result.

    METHODS Activate FOR MODIFY
       keys FOR ACTION zever_m_travel_i~Activate.

    METHODS Discard FOR MODIFY
       keys FOR ACTION zever_m_travel_i~Discard.

    METHODS Edit FOR MODIFY
       keys FOR ACTION zever_m_travel_i~Edit.

    METHODS Resume FOR MODIFY
       keys FOR ACTION zever_m_travel_i~Resume.
    METHODS validateCustomer FOR VALIDATE ON SAVE
       keys FOR zever_m_travel_i~validateCustomer.
    METHODS validateAgency FOR VALIDATE ON SAVE
       keys FOR zever_m_travel_i~validateAgency.
    METHODS setBooked FOR MODIFY
       keys FOR ACTION zever_m_travel_i~setBooked RESULT result.
    METHODS setDiscount FOR MODIFY
       keys FOR ACTION zever_m_travel_i~setDiscount RESULT result.
    METHODS lineCopy FOR MODIFY
       keys FOR ACTION zever_m_travel_i~lineCopy.
    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR zever_m_travel_i RESULT result.
    METHODS calculatetotalprice FOR DETERMINE ON MODIFY
       keys FOR zever_m_travel_i~calculatetotalprice.
    METHODS recalctotprice FOR MODIFY
       keys FOR ACTION zever_m_travel_i~recalctotprice.

    METHODS earlynumbering_cba_Booking FOR NUMBERING
       entities FOR CREATE zever_m_travel_i\_Booking.

    METHODS earlynumbering_create FOR NUMBERING
       entities FOR CREATE zever_m_travel_i.

ENDCLASS.

CLASS lhc_ZEVER_M_TRAVEL_I IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD Activate.
  ENDMETHOD.

  METHOD Discard.
  ENDMETHOD.

  METHOD Edit.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD earlynumbering_create.

    LOOP AT entities INTO DATA(ls_entities).

      IF ls_entities-TravelId IS INITIAL.
        TRY.
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr       = '01'
                object            = '/DMO/TRV_M'
              IMPORTING
                number            = DATA(lv_number)
            ).
          CATCH cx_nr_object_not_found INTO DATA(lo_error).
            failed-zever_m_travel_i   = VALUE #( BASE failed-zever_m_travel_i ( %cid      = ls_entities-%cid
                                                                                %is_draft = ls_entities-%is_draft ) ).
            reported-zever_m_travel_i = VALUE #( BASE reported-zever_m_travel_i ( %cid      = ls_entities-%cid
                                                                                  %is_draft = ls_entities-%is_draft
                                                                                  %msg      = lo_error ) ).
            CONTINUE.
          CATCH cx_number_ranges INTO DATA(lo_error2).
            failed-zever_m_travel_i   = VALUE #( BASE failed-zever_m_travel_i ( %cid      = ls_entities-%cid
                                                                                %is_draft = ls_entities-%is_draft ) ).
            reported-zever_m_travel_i = VALUE #( BASE reported-zever_m_travel_i ( %cid      = ls_entities-%cid
                                                                                  %is_draft = ls_entities-%is_draft
                                                                                  %msg      = lo_error2 ) ).
            CONTINUE.
        ENDTRY.
      ELSE.
        lv_number = ls_entities-TravelId.
      ENDIF.

      mapped-zever_m_travel_i = VALUE #( BASE mapped-zever_m_travel_i ( %cid     = ls_entities-%cid
                                                                        %is_draft = ls_entities-%is_draft
                                                                        TravelId = lv_number ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_Booking.

    DATA : lv_max_booking TYPE zever_m_booking_i-BookingId.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i BY \_booking
    FROM CORRESPONDING #( entities )
    RESULT DATA(lt_booking).

    SORT lt_booking BY TravelId BookingId DESCENDING.
    LOOP AT entities INTO DATA(ls_entities).

      READ TABLE lt_booking INTO DATA(ls_booking) WITH KEY TravelId = ls_entities-TravelId BINARY SEARCH.
      IF sy-subrc = 0.
        lv_max_booking = ls_booking-BookingId.
      ENDIF.

      LOOP AT ls_entities-%target INTO DATA(ls_target).
        IF ls_target-BookingId IS INITIAL.
          lv_max_booking = lv_max_booking + 10.
        ELSE.
          lv_max_booking = ls_target-BookingId.
        ENDIF.

        APPEND INITIAL LINE TO mapped-zever_m_booking_i ASSIGNING FIELD-SYMBOL(<fs_mapped>).
        <fs_mapped> = CORRESPONDING #( ls_target ).
        <fs_mapped>-BookingId = lv_max_booking.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateCustomer.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    IF lt_result IS NOT INITIAL.
      SELECT a~customer_id
        FROM /dmo/customer AS a INNER JOIN @lt_result AS b ON a~customer_id = b~customerid
       ORDER BY a~customer_id
        INTO TABLE @DATA(lt_customer).
    ENDIF.

    LOOP AT lt_result INTO DATA(ls_result).

      APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING FIELD-SYMBOL(<fs_reported>).
      <fs_reported>-%tky = ls_result-%tky.
      <fs_reported>-%state_area = 'VALIDATE_CUSTOMER'.

      IF ls_result-customerid IS NOT INITIAL.
        READ TABLE lt_customer INTO DATA(ls_customer) WITH KEY customer_id = ls_result-customerid BINARY SEARCH.
        IF sy-subrc <> 0.
          APPEND INITIAL LINE TO failed-zever_m_travel_i ASSIGNING FIELD-SYMBOL(<fs_failed>).
          <fs_failed>-%tky = ls_result-%tky.
          APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING <fs_reported>.
          <fs_reported>-%tky = ls_result-%tky.
          <fs_reported>-%element-customerid = if_abap_behv=>mk-on.
          <fs_reported>-%state_area = 'VALIDATE_CUSTOMER'.
          <fs_reported>-%msg = new_message( severity = if_abap_behv_message=>severity-error
                                            id       = 'ZEVER_M'
                                            number   = '000'
                                            v1       = TEXT-m01 ).
        ENDIF.
      ELSEIF ls_result-customerid IS INITIAL.
        APPEND INITIAL LINE TO failed-zever_m_travel_i ASSIGNING <fs_failed>.
        <fs_failed>-%tky = ls_result-%tky.
        APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING <fs_reported>.
        <fs_reported>-%tky = ls_result-%tky.
        <fs_reported>-%element-customerid = if_abap_behv=>mk-on.
        <fs_reported>-%state_area = 'VALIDATE_CUSTOMER'.
        <fs_reported>-%msg = new_message( severity = if_abap_behv_message=>severity-error
                                          id       = 'ZEVER_M'
                                          number   = '000'
                                          v1       = TEXT-m03 ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateAgency.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    IF lt_result IS NOT INITIAL.
      SELECT a~agency_id
        FROM /dmo/agency AS a INNER JOIN @lt_result AS b ON a~agency_id = b~agencyid
       ORDER BY a~agency_id
        INTO TABLE @DATA(lt_agency).
    ENDIF.

    LOOP AT lt_result INTO DATA(ls_result).

      APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING FIELD-SYMBOL(<fs_reported>).
      <fs_reported>-%tky = ls_result-%tky.
      <fs_reported>-%state_area = 'VALIDATE_AGENCY'.

      IF ls_result-agencyid IS NOT INITIAL.
        READ TABLE lt_agency INTO DATA(ls_agency) WITH KEY agency_id = ls_result-agencyid BINARY SEARCH.
        IF sy-subrc <> 0.
          APPEND INITIAL LINE TO failed-zever_m_travel_i ASSIGNING FIELD-SYMBOL(<fs_failed>).
          <fs_failed>-%tky = ls_result-%tky.
          APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING <fs_reported>.
          <fs_reported>-%tky = ls_result-%tky.
          <fs_reported>-%element-agencyid = if_abap_behv=>mk-on.
          <fs_reported>-%state_area = 'VALIDATE_AGENCY'.
          <fs_reported>-%msg = new_message( severity = if_abap_behv_message=>severity-error
                                            id       = 'ZEVER_M'
                                            number   = '000'
                                            v1       = TEXT-m02 ).
        ENDIF.
      ELSEIF ls_result-agencyid IS INITIAL.
        APPEND INITIAL LINE TO failed-zever_m_travel_i ASSIGNING <fs_failed>.
        <fs_failed>-%tky = ls_result-%tky.
        APPEND INITIAL LINE TO reported-zever_m_travel_i ASSIGNING <fs_reported>.
        <fs_reported>-%tky = ls_result-%tky.
        <fs_reported>-%element-agencyid = if_abap_behv=>mk-on.
        <fs_reported>-%state_area = 'VALIDATE_AGENCY'.
        <fs_reported>-%msg = new_message( severity = if_abap_behv_message=>severity-error
                                          id       = 'ZEVER_M'
                                          number   = '000'
                                          v1       = TEXT-m04 ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD setBooked.

    LOOP AT keys INTO DATA(ls_keys).
      MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
      ENTITY zever_m_travel_i
      UPDATE FIELDS ( status )
      WITH VALUE #( ( %tky = ls_keys-%tky
                      %data-Status = 'B' ) ).
    ENDLOOP.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

    LOOP AT lt_travel INTO DATA(ls_travel).
      result = VALUE #( ( %tky   = ls_travel-%tky
                          %param = CORRESPONDING #( ls_travel ) ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD setDiscount.

    SELECT TravelId
      FROM zever_m_travel_i
      INTO TABLE @DATA(lt_travel).

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( lt_travel )
    RESULT DATA(lt_travel_entity).

    LOOP AT lt_travel_entity ASSIGNING FIELD-SYMBOL(<fs_travel_entity>).
      <fs_travel_entity>-BookingFee = <fs_travel_entity>-BookingFee * '0.9'.
    ENDLOOP.

    MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    UPDATE FIELDS ( BookingFee ) WITH CORRESPONDING #( lt_travel_entity )
    FAILED DATA(lt_failed).

    result = VALUE #( FOR wa IN lt_travel_entity
                    ( %cid = VALUE #( keys[ 1 ]-%cid OPTIONAL )
                      %param = wa ) ).

  ENDMETHOD.

  METHOD lineCopy.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i BY \_booking
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_booking).

    DATA : lt_travel_create  TYPE TABLE FOR CREATE zever_m_travel_i,
           lt_booking_create TYPE TABLE FOR CREATE zever_m_travel_i\_booking.

    LOOP AT lt_travel INTO DATA(ls_travel).
      APPEND INITIAL LINE TO lt_travel_create ASSIGNING FIELD-SYMBOL(<fs_travel_create>).
      <fs_travel_create>-%cid      = VALUE #( keys[ 1 ]-%cid OPTIONAL ).
      <fs_travel_create>-%is_draft = ls_travel-%is_draft.
      <fs_travel_create>-%data     = CORRESPONDING #( ls_travel-%data EXCEPT TravelId ).
      CLEAR <fs_travel_create>-%data-TravelId.

      LOOP AT lt_booking USING KEY entity INTO DATA(ls_booking) WHERE TravelId = ls_travel-TravelId.
        APPEND INITIAL LINE TO lt_booking_create ASSIGNING FIELD-SYMBOL(<fs_booking_create>).
        <fs_booking_create>-%cid_ref  = VALUE #( keys[ 1 ]-%cid OPTIONAL ).
        <fs_booking_create>-%is_draft = ls_booking-%is_draft.
        <fs_booking_create>-%target   = VALUE #( ( VALUE #( BASE CORRESPONDING #( ls_booking EXCEPT TravelId )
                                                   %cid = <fs_travel_create>-%cid && ls_booking-BookingId ) ) ).
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    CREATE FIELDS ( AgencyId CustomerId BeginDate EndDate BookingFee TotalPrice CurrencyCode Description Status )
    WITH lt_travel_create

    ENTITY zever_m_travel_i CREATE BY \_booking
    FIELDS ( BookingId BookingDate CustomerId CarrierId ConnectionId FlightDate FlightPrice CurrencyCode )
    WITH lt_booking_create
    MAPPED DATA(lt_mapped)
    FAILED DATA(lt_failed).

    IF lt_failed IS INITIAL.
      mapped-zever_m_travel_i = lt_mapped-zever_m_travel_i.
      reported-zever_m_travel_i = VALUE #( ( %tky = lt_mapped-zever_m_travel_i[ 1 ]-%tky
                                             %msg = new_message_with_text( severity = if_abap_behv_message=>severity-information
                                                                           text     = 'Coping Complete' ) ) ).
    ENDIF.

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    FIELDS ( TravelId Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

    result = VALUE #( FOR ls_travel IN lt_travel
                    ( %tky = ls_travel-%tky
                      %features-%delete          = COND #( WHEN ls_travel-Status = 'B'
                                                           THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled )
                      %features-%action-lineCopy = COND #( WHEN ls_travel-Status = 'B'
                                                           THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled ) ) ).

  ENDMETHOD.

  METHOD calculateTotalPrice.

    MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    EXECUTE recalcTotPrice
    FROM CORRESPONDING #( keys ).

  ENDMETHOD.


  METHOD recalcTotPrice.

    READ ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_travel)

    ENTITY zever_m_travel_i BY \_booking
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_booking).

    LOOP AT lt_travel ASSIGNING FIELD-SYMBOL(<fs_travel>).

      <fs_travel>-TotalPrice = <fs_travel>-BookingFee.

      LOOP AT lt_booking USING KEY entity INTO DATA(ls_booking) WHERE TravelId = <fs_travel>-TravelId.
        <fs_travel>-TotalPrice = <fs_travel>-TotalPrice + ls_booking-FlightPrice.
      ENDLOOP.

    ENDLOOP.

    MODIFY ENTITIES OF zever_m_travel_i IN LOCAL MODE
    ENTITY zever_m_travel_i
    UPDATE FIELDS ( TotalPrice )
    WITH CORRESPONDING #( lt_travel )
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

  ENDMETHOD.

ENDCLASS.
