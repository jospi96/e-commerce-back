<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */

    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */

    public function rules(): array
    {
        return [

            'id_customer' => 'required',
           // "id_discount_code" => "required",
            "shipping_address" => "required",
            "shipping_postal_code" => "required",
            "shipping_country"  => "required",
            "shipping_city"=> "required",
            'products'=> "required",
        ];
    }
}
