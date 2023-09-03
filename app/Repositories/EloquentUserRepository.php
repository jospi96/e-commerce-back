<?php

namespace App\Repositories;
use App\Repositories\Contract\UserRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;
use Tymon\JWTAuth\Claims\Collection;
use App\Models\User;


/**
 * Summary of EloquentUserRepository
 */
Class EloquentUserRepository implements UserRepositoryInterface
{


	public function getModel() {

        return new User;
	}
	
	

	public function create(array $data) {

        return $this->getModel()->create($data);
	}
	

	public function update(int $id,array $data) {

        return $this->getModel()->find($data['id'])->update($data);
	}
	
	public function delete(int $id ,array $data) {
		return $this->getModel()->destroy($data);
	}
	
	

	public function findByid($id) {
		return $this->getModel()->find($id);
	}
	
	public function findByEmail($email) {
		
		return $this->getModel()->where('email',"=",$email)->first();
	}

	/**
	 * Summary of paginator
	 * @param int $num
	 * @return Collection
	 */
	public function paginator(int $num = 25):LengthAwarePaginator  {
		return $this->getModel()->paginate($num);
	}

	

}


?>