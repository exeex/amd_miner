## 安裝相關套件
sudo apt-get install -y openssh-server ocl-icd-opencl-dev libcurl3 xz-utils unzip screen vim


## 抓挖礦腳本
## 這是我個人的維護的腳本庫，未來會持續新增一些相關功能
## 你也可以從官方抓Claymore來用
cd ~/Downloads
wget https://github.com/exeex/amd_miner/archive/master.zip &&\
unzip master.zip &&\
cp -r amd_miner-master/* ~/ &&\
cd

##腳本設置
echo "alias miner='screen -x ethm'" >> ~/.bashrc



## 安裝驅動


mkdir ~/Downloads &&\
cd ~/Downloads &&\
wget --referer=http://support.amd.com https://www2.ati.com/drivers/linux/beta/ubuntu/amdgpu-pro-17.40-483984.tar.xz &&\
tar -Jxvf amdgpu-pro-17.40-483984.tar.xz &&\
cd amdgpu-pro-17.40-483984 &&\
./amdgpu-pro-install -y &&\
sudo usermod -a -G video $LOGNAME &&\
sudo apt install -y rocm-amdgpu-pro &&\
echo 'export LLVM_BIN=/opt/amdgpu-pro/bin' | sudo tee /etc/profile.d/amdgpu-pro.sh &&\
cd -



## 修改虛擬記憶體大小

sudo cp /etc/default/grub /etc/default/grub.bak

sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=\"*\"/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash amdgpu.vm_fragment_size=9 pci=nomsi pci=noaer\"/g' /etc/default/grub

sudo update-grub
sudo reboot
