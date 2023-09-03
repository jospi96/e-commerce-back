<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class RegisterRequest extends FormRequest {
    /**
    * Determine if the user is authorized to make this request.
    */

    public function authorize(): bool {
        return true;
    }

    /**
    * Get the validation rules that apply to the request.
    *
    * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
    */

    public function rules(): array {
        return [
            
            'email' =>'required|email|confirmed|unique:user,email',
            'password' =>[ 'required','confirmed', Password::min( 8 )->letters()
            ->mixedCase()
            ->numbers()
            ->symbols()
            ->uncompromised() ],
            "first_name"=>"",
            "last_name"=>"",
            "phone"=>"|numeric|unique:user,phone,$this->id,id",
            "billing_address"=>"",
            "shipping_address"=>"",
            "billing_postal_code"=>"|numeric|",
            "shipping_postal_code"=>"|numeric|",
            "billing_city"=>"",
            "shipping_city"=>"",
            "billing_cauntry"=>"",
            "shipping_country"=>"",
            "vat_number"=>"",
            "business_name"=>""

        ];
    }
}
