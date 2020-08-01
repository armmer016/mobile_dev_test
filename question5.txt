Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: Image.asset('path to image').image,
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Title goes here',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Secondary text',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(onTap: () {}, child: Text('ACTION 1', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),)),
                        SizedBox(width: 20,),
                        InkWell(onTap: () {}, child: Text('ACTION 2', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
