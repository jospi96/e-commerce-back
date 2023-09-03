<?php

namespace App\Repositories;

use App\Models\Discount;
use App\Repositories\Contract\DiscountRepositoryInterface;

/**
 * Summary of EloquentUserRepository
 */
class EloquentDiscountRepository implements DiscountRepositoryInterface
{

    public function getModel()
    {

        return new Discount;
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

    public function findByCode(string $code){

        return $this->getModel()->where("code", $code)->first();
       
        

    }

}