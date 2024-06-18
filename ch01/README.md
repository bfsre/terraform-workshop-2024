## Lab 1 

### Open GCP Cloud Shell

![alt text](<../course_img/cloudconsole.png>)

點擊右上角終端機圖示，開啟 cloud shell

### Download lab repo

於 cloud shell 使用下列指令：

```shell
git clone https://github.com/bfsre/terraform-workshop-2024.git
```


### Modify variables


```shell
cd terraform-workshop-2024/ch01
# 開啟 cloud editor，找到 terraform-workshop-2024/ch01/variables.auto.tfvars
cloudshell edit . 
```

修改 variables.auto.tfvars 成你的專案環境
```shell
project_name   = "your-project-name" # 當前 GCP 專案名稱
default_region = "asia-east1"
default_zone   = "asia-east1-a" 
vpc_name = "your_vpc_name" # 取你想要的名字
```

### Deploy your first terraform 

執行 terraform 三部曲
```shell
terraform init
terraform plan
terraform apply
```