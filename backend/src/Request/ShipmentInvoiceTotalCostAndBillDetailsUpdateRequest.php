<?php

namespace App\Request;

class ShipmentInvoiceTotalCostAndBillDetailsUpdateRequest
{
    private $id;

    private $totalCost;

    private $billDetails;

    private $buyingDetails;

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setTotalCost($totalCost)
    {
        $this->totalCost = $totalCost;
    }

    public function getTotalCost()
    {
        return $this->totalCost;
    }

    public function setBillDetails($billDetails)
    {
        $this->billDetails = $billDetails;
    }

    public function getBillDetails()
    {
        return $this->billDetails;
    }

    public function getBuyingDetails()
    {
        return $this->buyingDetails;
    }

    public function setBuyingDetails($buyingDetails)
    {
        $this->buyingDetails = $buyingDetails;
    }

}