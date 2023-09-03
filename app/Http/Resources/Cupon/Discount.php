<?php
namespace App\Http\Resources\Cupon;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Discount extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $costumerOutput = isset($this->id) ? [
            "id" => $this->id,
            "code" => $this->code,
            "description" => $this->description,
            "discont_percentual" => $this->discont_percentual,
            "status" => $this->status(),

        ] : ["status" => [
            "message" => "This cupon do not exist",
            "status" => false],
        ];

        return $costumerOutput;
    }

    public function status()
    {
        if ($this->date_start > date("Y-m-d")) {

            return
                [
                "message" => "This discount code is not available, it will start at" . $this->date_start,
                "status" => false,
            ];

        } else if ($this->date_end <= date("Y-m-d")) {

            return
                [
                "message" => "This discount code is not available, it is expired at" . $this->date_end,
                "status" => false,
            ];

        } else if ($this->permitted_uses < $this->uses_made) {
            return
                [
                "message" => "This discount code is expired for over uses",
                "status" => false,
            ];
        }
        return [
            "message" => "ok",
            "status" => true,
        ];
    }
}
