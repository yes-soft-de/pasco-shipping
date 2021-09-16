<?php

namespace App\Constant;

class ShipmentStatusConstant
{
    static $ACCEPTED_SHIPMENT_STATUS = "accepted";

    static $RECEIVED_SHIPMENT_STATUS = "received";

    static $UNDEFINED_SHIPMENT_STATUS = "undefined";

    static $MEASURED_SHIPMENT_STATUS = "measured";

    static $STORED_SHIPMENT_STATUS = "stored";

    static $UPLOADED_SHIPMENT_STATUS = "uploaded";

    static $STARTED_SHIPMENT_STATUS = "started";

    static $RELEASED_SHIPMENT_STATUS = "released";

    static $CLEARED_SHIPMENT_STATUS = "cleared";

    static $ARRIVED_SHIPMENT_STATUS = "arrived";

    static $DELIVERED_SHIPMENT_STATUS = "delivered";

    static $UNDELIVERED_SHIPMENT_STATUS = "undelivered";

    static $ALL_SHIPMENT_STATUS = "all";

    static $SHIPMENT_STATUS_ARRAY = [
        "waiting", "accepted", "received", "measured", "stored", "uploaded", "started", "released", "cleared", "arrived", "delivered"
    ];

    static $SHIPMENT_STATUS_FOR_CLIENT_ARRAY = [
        "waiting", "accepted", "received", "started", "released", "delivered"
    ];

}