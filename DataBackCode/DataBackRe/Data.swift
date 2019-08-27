/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let id : Int?
	let api_token : String?
	let image : String?
	let name : String?
	let email : String?
	let activeCode : String?
	let password : String?
	let mobile : String?
	let email_verified_at : Bool?
	let mobile_verified_at : Bool?
	let fire_base_token : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case api_token = "api_token"
		case image = "image"
		case name = "name"
		case email = "email"
		case activeCode = "activeCode"
		case password = "password"
		case mobile = "mobile"
		case email_verified_at = "email_verified_at"
		case mobile_verified_at = "mobile_verified_at"
		case fire_base_token = "fire_base_token"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		api_token = try values.decodeIfPresent(String.self, forKey: .api_token)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		activeCode = try values.decodeIfPresent(String.self, forKey: .activeCode)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		email_verified_at = try values.decodeIfPresent(Bool.self, forKey: .email_verified_at)
		mobile_verified_at = try values.decodeIfPresent(Bool.self, forKey: .mobile_verified_at)
		fire_base_token = try values.decodeIfPresent(String.self, forKey: .fire_base_token)
	}

}