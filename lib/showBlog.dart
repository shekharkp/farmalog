import 'package:flutter/material.dart';

class ShowBlog extends StatelessWidget {
  const ShowBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,bottom: 10,right: 10,left: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Researchers Helping Protect Crops From Pests | National institute of food and agriculture",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF333c3a)),),
                SizedBox(height: 5,),
                Text("by shekhar patil",style: TextStyle(color: Colors.grey)),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                AspectRatio(
                  aspectRatio: 1 / 0.7,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("lib/assets/Fig.1-resized.png"),
                        fit: BoxFit.cover,
                        opacity: 1,
                      ),
                    ),
                  ),
                ),
                Text("""With support from USDA’s National Institute of Food and Agriculture, Land-grant University researchers are addressing high-priority issues related to pests including insects, nematodes, pathogens and weeds, and their management using Integrated Pest Management (IPM) approaches at the state, regional and national levels. 

                    NIFA’s Crop Protection and Pest Management (CPPM) program supports projects that will increase food security and respond effectively to other major societal challenges with comprehensive IPM approaches that are economically viable, ecologically prudent and safe for human health. The program also addresses pest management challenges with new and emerging technologies.

        One of the three program areas of CPPM is the Applied Research and Development Program Area (ARDP). This program area funds projects for the development of new IPM tactics, technologies, practices and strategies through research projects. ARDP also funds IPM adoption through research-led projects and IPM implementation through Extension-led projects. Learn more about some of the advances that have been made with funding from this grant program, which is soliciting its next round of grant applications. The application deadline is February 13.
        phids and the viruses they transmit damage many food crops, including wheat. Growers, crop advisors and IPM specialists need vigilance as well as knowledge of aphid species and their injury potential to manage them properly. However, there is limited information regarding the newly invasive cereal grass aphid, M. festucae cerealium, and its potential for causing crop losses.  

Furthermore, the knowledge on genetic diversity of the cereal grass aphid is lacking but essential for effective pest management, such as developing economic thresholds, assessing insecticide resistance and determining the capacity to transmit pathogens. 

In response, researchers at University of Idaho are developing a decision support tool that will simplify decisions about identifying and managing the aphid pest complex in the Pacific Northwest cereals. 

“The threat of invasive insect pests affecting major commodities represents a challenge that requires comprehensive approaches to understanding the biology of these pests, the vulnerability of cropping systems and science-based practices for managing them,” said University of Idaho project director Dr. Sanford Eigenbrode. “NIFA funding has supported valuable research on a newly invasive aphid’s biology, ecology, damage potential, virus transmissibility and potential distribution in the United States.”  """,
                  style: TextStyle(color: Colors.black87,),textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
