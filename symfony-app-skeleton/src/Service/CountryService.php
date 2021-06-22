<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\CountryEntity;
use App\Manager\CountryManager;
use App\Request\CountryCreateRequest;
use App\Response\CountryCreateResponse;
use App\Response\CountryGetResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CountryService
{
    private $autoMapping;
    private $countryManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, CountryManager $countryManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->countryManager = $countryManager;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create(CountryCreateRequest $request)
    {
        $countryResult = $this->countryManager->create($request);

        return $this->autoMapping->map(CountryEntity::class, CountryCreateResponse::class, $countryResult);
    }

    public function getAllCountries()
    {
        $countryResponse = [];

        $countries = $this->countryManager->getAllCountries();

        foreach ($countries as $country)
        {
            if($country['createdByUserImage'])
            {
                $country['createdByUserImage'] = $this->params . $country['createdByUserImage'];
            }

            if($country['updatedByUserImage'])
            {
                $country['updatedByUserImage'] = $this->params . $country['updatedByUserImage'];
            }

            $countryResponse[] = $this->autoMapping->map('array', CountryGetResponse::class, $country);
        }

        return $countryResponse;
    }

    public function deleteCountryById($request)
    {
        $result = $this->countryManager->deleteCountryById($request);

        return $this->autoMapping->map(CountryEntity::class, CountryGetResponse::class, $result);
    }

}