<?php
namespace App\Http\Resources\user;
use Illuminate\Http\Resources\Json\JsonResource;

Class UserIndexResurce extends JsonResource {

    /**
    * trasform resurce into an array
    * @param \Illuminate\Http\Request
    * @return array
    */

    public function toArray( $request ) {

        $customerOutput = [
            'id' => $this->id,
            'first_name' => $this->name,
            'last_name' => $this->surname,
            "email" => $this->email,

            /*
            "phone" => $this->phone,
            'billing_address' => $this->billing_address,
            'shipping_address' => $this->shipping_address,
            'billing_post_code' => $this->billing_post_code,
            'shipping_post_code' => $this->shipping_post_code,
            'billing_city' => $this->billing_city,
            'shipping_city' => $this->shipping_city,
            'billing_cauntry' => $this->billing_cauntry,
            'shipping_country' => $this->shipping_country,
            'vat_number' => $this->vat_number,
            'business_name' => $this->business_name,

            In this case i just need only names, id and email
            */

        ];

        return $customerOutput;
    }

}

?>