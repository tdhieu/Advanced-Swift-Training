using UnityEngine;
using System.Collections;

public class HinhVuongControlle : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		float moveHorizontal = Input.GetAxis ("Horizontal");
		float moveVertical = Input.GetAxis("Vertical");
		
		Vector3 move = new Vector3 (moveHorizontal, 0.0f, moveVertical);
		transform.Translate (move * 0.2f);
	}
}