<?php

namespace App\Repositories;

use App\Models\Brand;
use App\Repositories\Contract\BrandRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;
use Tymon\JWTAuth\Claims\Collection;

/**
 * Summary of EloquentBrandRepository
 */
class EloquentBrandRepository implements BrandRepositoryInterface
{

    public function getModel()
    {

        return new Brand;
    }

    public function create(array $data)
    {

        return $this->getModel()->create($data);
    }

    public function update(int $id, array $data)
    {

        return $this->getModel()->find($data['id'])->update($data);
    }

    public function delete(int $id, array $data)
    {
        return $this->getModel()->destroy($data);
    }

    public function findByid($id)
    {
        return $this->getModel()->find($id);
    }

    /**
     * Summary of paginator
     * @param int $num
     * @return Collection
     */
    public function paginator(int $num = 25): LengthAwarePaginator
    {
        return $this->getModel()
        ->paginate($num);

    }

    public function productBrand(int $id, int $num = 25 ): LengthAwarePaginator
    {
        return $this->getModel()
        ->whereId($id)
        ->with('products')
        ->paginate($num);

    }

}
