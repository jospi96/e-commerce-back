<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;


class UserModifyRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }
/**
 * {@inheritdoc}
 */

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
      
        return  [
            "id" => "required|numeric",
            "first_name"=>"",
            "last_name"=>"",
            "email"=>"email|unique:user,email,$this->id,id",
            "phone"=>"|numeric|unique:user,phone,$this->id,id",
            "billing_address"=>"",
            "shipping_address"=>"",
            "billing_post_code"=>"",
            "shipping_post_code"=>"",
            "billing_city"=>"",
            "shipping_city"=>"",
            "billing_cauntry"=>"",
            "shipping_country"=>"",
            "vat_number"=>"",
            "business_name"=>""
            
            
           
            
        ];
    }
}
