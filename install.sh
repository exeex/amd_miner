## 安裝相關套件
sudo apt-get install -y openssh-server ocl-icd-opencl-dev libcurl3 xz-utils unzip


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
