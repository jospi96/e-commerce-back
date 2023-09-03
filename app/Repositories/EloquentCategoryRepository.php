<?php

namespace App\Repositories;

use App\Models\Category;
use App\Repositories\Contract\CategoryRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;
use Tymon\JWTAuth\Claims\Collection;

/**
 * Summary of EloquentUserRepository
 */
class EloquentCategoryRepository implements CategoryRepositoryInterface
{

    public function getModel()
    {

        return new Category;
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
    public function get()
    {
        return $this->getModel()
        ->get()->All();

    }
    public function Categoryproduct($id):LengthAwarePaginator{
        
return $this->getModel()::with("product")->where('id',$id)->paginate();
    }
}