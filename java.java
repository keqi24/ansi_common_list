


int add(int arg1, int arg2) {
    return arg1 + arg2;
}



CopyTask copy = new CopyTask();
Fileset fileset = new Fileset();

fileset.setDir("src_dir");
copy.setToDir("../new/dir");
copy.setFileset(fileset);

copy.execute();





copy("../new/dir")
{
    fileset("src_dir");
}


unless(someObject.canFly())
{
    someObject.transportByGround();
}

