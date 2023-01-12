const MyToken = artifacts.require('MyToken')

contract('MyToken', (accounts) => {
  let mt = null
  before(async () => {
    mt = await MyToken.deployed()
  })

  it('should Transfer tokens', async () => {
    await mt.transfer(accounts[2], 1000000000)
    const balance = await mt.balanceOf(accounts[2])
    assert(balance == 1000000000)
  })

  it('should approve tokens to another address', async () => {
    await mt.approve(accounts[5], 5000000000)
    // const balance = await mt.balanceOf(accounts[5])
    // assert(balance == 5000000000)
  })

  it('should Transfer tokens From 1 address to other', async () => {
    await mt.approve(accounts[5], 5000000000)
    await mt.transferFrom(
      accounts[0],
      '0x8C95B3ff914c344496fc38397Baed2cF30FAA2df',
      3000000000,
      { from: accounts[5] },
    )
    const balance = await mt.balanceOf(
      '0x8C95B3ff914c344496fc38397Baed2cF30FAA2df',
    )
    assert(balance == 3000000000)
  })
})

// it('Create user' , async () => {
//   await crud.create('Zia')
//   const user = await crud.read(1)
//   assert(user[0].toNumber() == 1)
//   assert(user[1] == 'Zia')
// })

// it('Read user' , async () => {
//   // await crud.read(1)
//   const user = await crud.read(1)
//   assert(user[0].toNumber() == 1)
//   assert(user[1] == 'Zia')
// })

// it('Update user' , async () => {
//   await crud.update(1, 'Zia Ullah')
//   const user = await crud.read(1)
//   assert(user[0].toNumber() == 1)
//   assert(user[1] == 'Zia Ullah')
// })

// it('Should not Update user' , async () => {
//   try{
//   await crud.update(2, 'Zia Ullah')
// } catch(a) {
//   assert(a.message.includes('User does not exist!'))
//   return
// }
// assert(false)
// })

// it('Delete User' , async () => {
//   await crud.destroy(1)
//   try{
//   await crud.read(1)
// } catch(a) {
//   assert(a.message.includes('User does not exist!'))
//   return
// }
// assert(false)
// })
//   it('Add data to array', async () => {
//     // const simple = await Simple.deployed()
//     await simple.setData(45)
//     const result = await simple.data(0)
//     // console.log(simple.address, result);
//     assert(result.toNumber() == 45)
//   })

//   it('Get data from array', async () => {
//     // const simple = await Simple.deployed()
//     await simple.setData(60)
//     const result = await simple.getData(1)
//     // console.log(simple.address, result);
//     assert(result.toNumber() == 60)
//   })

//   it('Get alldata from array', async () => {
//     // const simple = await Simple.deployed()
//     // await simple.setData(60);
//     const resultIds = await simple.getAll()
//     const ids = resultIds.map((id) => id.toNumber())
//     // console.log(simple.address, result);
//     assert.deepEqual(ids, [45, 60])
//   })

//   it('Get length of array', async () => {
//     // const simple = await Simple.deployed()
//     // await simple.setData(60);
//     const Length = await simple.length()
//     // const ids = resultIds.map((id) => id.toNumber())
//     // console.log(simple.address, result);
//     assert(Length == 2)
//   })
