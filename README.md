[![](https://images.microbadger.com/badges/image/cilerler/mkdocs.svg)](http://microbadger.com/images/cilerler/mkdocs "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cilerler/mkdocs.svg)](http://microbadger.com/images/cilerler/mkdocs "Get your own version badge on microbadger.com")

# Docker file for [MkDocs](http://www.mkdocs.org/) _(including [Material theme](http://squidfunk.github.io/mkdocs-material/))_

MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

## Create a new project
```
docker run -it --rm -v $Home/Desktop/DockerVolumes/mkdocs:/docs cilerler/yildiz mkdocs new MyProject
```
_Make sure you replace **/Desktop/DockerVolumes/mkdocs** and **MyProject** parts with your own!_


## Build the project

1. Change your directory to the project folder
  ```
  cd C:\Users\USERNAME\Desktop\DockerVolumes\mkdocs\MyProject
  ```
  _Make sure you replace **C:\Users\USERNAME\Desktop\DockerVolumes\mkdocs\MyProject** part with your own one!_

2. Following command will generate **site** folder under your project folder
  ```
  docker run -it --rm -v $Home/Desktop/DockerVolumes/mkdocs:/docs cilerler/yildiz mkdocs build
  ```
  _Make sure you replace **/Desktop/DockerVolumes/mkdocs** part with your own one!_

  > You may add `/docs/site` as volume to generate the **site** folder under different path.


## Deploy the project to GitHub

MkDocs will build your docs and use the [ghp-import](https://github.com/davisp/ghp-import) tool to commit them to the gh-pages branch and push the **gh-pages** branch to GitHub.

Be aware that you will not be able to review the built site before it is pushed to GitHub. Therefore, you may want to verify any changes you make to the docs beforehand by using the `build` command and reviewing the built files locally.

> **Warning**  
> You should never edit files in your gh-pages branch by hand if you're using the gh-deploy command because you will lose your work.

1. Change your directory to the project folder
  ```
  cd C:\Users\USERNAME\Desktop\DockerVolumes\mkdocs\MyProject
  ```
  _Make sure you replace **C:\Users\USERNAME\Desktop\DockerVolumes\mkdocs\MyProject** part with your own one!_

2. Setup your GIT repository and add remote
  ```
  git init
  git remote add origin https://github.com/cilerler/yildiz.git
  docker run -it --rm -v $Home/Desktop/DockerVolumes/mkdocs:/docs cilerler/yildiz mkdocs gh-deploy --clean
  ```
  _Make sure you replace **cilerler/yildiz.git** and **/Desktop/DockerVolumes/mkdocs** part with your own!_
