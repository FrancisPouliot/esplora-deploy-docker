git clone https://github.com/blockstream/esplora
cp -r esplora-add/* esplora
cd esplora
docker build -t esplora .
cd ..
mkdir -p tor/hidden_service
chmod 700 tor/hidden_service
sudo chown 2000:2000 tor/hidden_service
