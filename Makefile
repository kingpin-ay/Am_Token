-include .env



.PHONY: update build test snapshot format

update:; forge update

build:; forge build

test :; forge test 

snapshot_sepolia :; @forge snapshot --fork-url $(SEPOLIA_NET)
snapshot_main :; @forge snapshot --fork-url $(ETH_MAIN_NET)

format :; forge fmt

.PHONY: test_sepolia
test_sepolia:
	@forge test --fork-url $(SEPOLIA_NET) 

.PHONY: test_Main
test_main:
	@forge test --fork-url $(ETH_MAIN_NET) 

.PHONY: deploy
deploy:
	@forge script script/DeployAmToken.s.sol:DeployAmToken --rpc-url $(SEPOLIA_NET) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv



# cast send --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d  0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "mint(string memory)" "https://example.com/alice" --rpc-url http://127.0.0.1:8545
