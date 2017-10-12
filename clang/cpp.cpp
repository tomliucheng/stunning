c++

most vexing parse

//read a file to a string
std::ifstream file("path/to/some/file.ext");
std::string contents(
    std::istreambuf_iterator<char>(file),
    (std::istreambuf_iterator<char>())
);

