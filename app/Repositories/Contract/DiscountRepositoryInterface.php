<?php

namespace App\Repositories\Contract;
;

/**
 * Summary of UserRepositoryInterface
 */
interface DiscountRepositoryInterface
 { 
    public function getModel();

    public function create( array $data );

    public function update( int $id, array $data );

    public function delete( int $id, array $data );

    public function findByid( $id );
    public function findByCode( string $code );

}