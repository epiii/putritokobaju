<?php
  include 'dbcon.php';

  function pr($par) {
    echo "<pre>";
      print_r($par);
    echo"</pre>";
    exit();
  }
  function vd($par) {
    echo "<pre>";
      var_dump($par);
    echo"</pre>";
    exit();
  }

  function getDataByParam($table,$par,$val){
    global $conn;
    // pr($conn);
    $whr = $val!=''?' WHERE '.$par.'="'.$val.'"':'';
    $s='SELECT * FROM '.$table.$whr.' ORDER BY '.$par.' ASC';
    // pr($s);
    $e=mysqli_query($conn,$s);
    $r=mysqli_fetch_assoc($e);
    return [
      'status'=>$e?'success':'failed to load data',
      'data'  =>$r
    ];
  }

  function getListByParam($table,$par,$val){
    global $conn;
    $whr = $val!=''?' WHERE '.$par.'="'.$val.'"':'';
    $s='SELECT * FROM '.$table.$whr.' ORDER BY '.$par.' ASC';
    $e=mysqli_query($conn,$s);
    $n=mysqli_num_rows($e);
    $data=[];
    // pr($s);

    while ($r=mysqli_fetch_assoc($e)){
      $data[]=$r;
    }
    $out= [
      'status'=>$e?'success':'failed to load data',
      'num'  =>$n,
      'data'  =>$data
    ];
    return $out;
  }
?>
