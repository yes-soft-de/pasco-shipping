<?php

namespace App\Request;

class PricesFilterRequest
{
    private $exportCountryID;

    private $exportCity;

    private $importCountryID;

    private $importCity;

    public function getExportCountryID()
    {
        return $this->exportCountryID;
    }

    public function getExportCity()
    {
        return $this->exportCity;
    }

    public function getImportCountryID()
    {
        return $this->importCountryID;
    }

    public function getImportCity()
    {
        return $this->importCity;
    }

    public function setExportCountryID($exportCountryID)
    {
        $this->exportCountryID = $exportCountryID;
    }

    public function setExportCity($exportCity)
    {
        $this->exportCity = $exportCity;
    }

    public function setImportCountryID($importCountryID)
    {
        $this->importCountryID = $importCountryID;
    }

    public function setImportCity($importCity)
    {
        $this->importCity = $importCity;
    }

}