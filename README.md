# flutter_create_contest

Flutter create contest application submitted by Amol Gangadhare and Gaurav Chafe.

## Getting Started

  `flutter run --release`

### Theme: 
The theme of the app is based on simple mathematical puzzle. There are 21 match sticks. 
You can pick sticks between 1 and 4. After your turn <b>Betty</b> (name given to computer) will pick up sticks.
This cycle continues till the sticks lasts. Anyone who will pick last stick is looser. Try not to pick last one.

#### Code:

   `stx = 21`  Total sticks. This is a counter for maintaining sticks.
   
   `upk = 0`   User Picked Keys. This is used to show user selected sticks.(i.e. how many sticks user selected)
   
   `cpk = 0`   Computer Picked Keys. This is used to show computer selected sticks.(i.e. how many sticks computer selected)
   
   `flg = -1`  Flag. This flag is used to maintain the user or computer state.(i.e. is user/computer)
   
   `ct = 1`    Computer Thinking. This is used to manipulate ui as computer thinking state.
   
  `List kys = [1, 2, 3, 4]` Sticks key buttons. This is a temp list to dynamically create buttons.(i.e. stick buttons)

 
 Assets used in <b>flr/</b> can be seen at https://www.2dimensions.com/a/AmolGangadhare
 