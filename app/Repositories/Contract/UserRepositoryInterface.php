<?php

namespace App\Repositories\Contract;
use Tymon\JWTAuth\Claims\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 * Summary of UserRepositoryInterface
 */
interface UserRepositoryInterface
 { 
    public function getModel();

    public function create( array $data );

    public function update( int $id, array $data );

    public function delete( int $id, array $data );

    public function findByid( $id );

    /**
     * Summary of paginator
     * @param int $num
     * @return Collection
     */
    public function paginator( int $num = 25 ):LengthAwarePaginator ;
    public function findByEmail($email);
}
?>