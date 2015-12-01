using UnityEngine;
using System.Collections;

public class QuaiVatController : MonoBehaviour {

	// Bat dau va cham
	void OnCollisionEnter(Collision collision) {
		if (collision.gameObject.tag == "NhanVat") {
			Destroy (collision.gameObject);
			Destroy (gameObject);
		}
	}

	// Dang trong qua trinh va cham, ham nay co the duoc goi nhieu lan
	void OnCollisionStay(Collision collision) {
		
	}

	// Thoat khoi va cham
	void OnCollisionExit(Collision collisionInfo) {
		
	}
}
