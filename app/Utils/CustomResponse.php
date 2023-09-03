<?php
namespace App\Utils;

class CustomResponse
{
public static function setSuccessResponse($code, $message=null,$objName=null,$data=null,$body=null){
    $params = array(
        "success" => true,
        "status"=> $code,
    );  
        if ($objName && !$body) {
        $params [$objName] = $data;
        }
        if($body){
            $params['user'] = $body;
            $params['user'][$objName]=$data;
        }
        if ($message) {
        $params ['message'] = $message;
        return response()->json($params, $code);
}
}
public static function SetFailResponse( $message, $code, $errors = null)
{
return response()->json([
    "success" => false,
    "status" => $code,
    "message" => $message,
    "errors" => $errors,
],$code);

}
}
?>